#!/bin/bash

if [[ ${1}x == ""x ]]; then
        echo "Usage:"
        echo "$0 gen <out_interface>"
        echo "$0 add <out_interface> <number> <name>"

        exit 1;

fi

if ! command -v qrencode &> /dev/null
then
    echo "qrencode could not be found"
    exit 2;
fi


OUT_INTERFACE=${2}

serverip=$(ip a show ${2} | awk  -v vintr="inet.*$OUT_INTERFACE" '$0 ~ vintr {print $2}')
realserverip=${serverip%%/*}

Endpoint=$realserverip:8080
SERVER_IP_ADDR=10.200.200.1/24,fd42:42:42::1/64
CLIENT_IP_ADDR=10.200.200.2/32,fd42:42:42::2/128
escSERVER_IP_ADDR=${SERVER_IP_ADDR//\//\\/}
escCLIENT_IP_ADDR=${CLIENT_IP_ADDR//\//\\/}

if [[ ${1} == "gen" ]]; then

	./genkey.sh server
	./genkey.sh client

	SERVER_PRIVATE_KEY=$(cat server.key)
	SERVER_PUBLIC_KEY=$(cat server.pub)

	CLIENT_PRIVATE_KEY=$(cat client.key)
	CLIENT_PUBLIC_KEY=$(cat client.pub)


	escSERVER_PRIVATE_KEY=${SERVER_PRIVATE_KEY//\//\\/}
	escSERVER_PUBLIC_KEY=${SERVER_PUBLIC_KEY//\//\\/}
	escCLIENT_PRIVATE_KEY=${CLIENT_PRIVATE_KEY//\//\\/}
	escCLIENT_PUBLIC_KEY=${CLIENT_PUBLIC_KEY//\//\\/}



	cp tmpl.server.conf server.conf

	sed -i "s/SERVER_PRIVATE_KEY/${escSERVER_PRIVATE_KEY}/" server.conf
	sed -i "s/PEER_PUBLIC_KEY/${escCLIENT_PUBLIC_KEY}/" server.conf
	sed -i "s/SERVER_IP_ADDR/${escSERVER_IP_ADDR}/" server.conf
	sed -i "s/CLIENT_IP_ADDR/${escCLIENT_IP_ADDR}/" server.conf
	sed -i "s/OUT_INTERFACE/${OUT_INTERFACE}/g" server.conf


	cp tmpl.client.conf client.conf

	sed -i "s/PEER_PRIVATE_KEY/${escCLIENT_PRIVATE_KEY}/" client.conf
	sed -i "s/SERVER_PUBLIC_KEY/${escSERVER_PUBLIC_KEY}/" client.conf
	sed -i "s/my.ddns.example.com:51820/${Endpoint}/" client.conf
	sed -i "s/IP_ADDR/${escCLIENT_IP_ADDR}/g" client.conf

exit 0;

fi

if [[ ${1} == "add" ]]; then

	CLIENT_IP_ADDR="10.200.200".${3}/32,fd42:42:42::${3}/128
	escCLIENT_IP_ADDR=${CLIENT_IP_ADDR//\//\\/}

	CLIENT_NAME=${4}
	./genkey.sh ${CLIENT_NAME}

	SERVER_PRIVATE_KEY=$(cat server.key)
	SERVER_PUBLIC_KEY=$(cat server.pub)

	CLIENT_PRIVATE_KEY=$(cat ${CLIENT_NAME}.key)
	CLIENT_PUBLIC_KEY=$(cat ${CLIENT_NAME}.pub)

	escSERVER_PRIVATE_KEY=${SERVER_PRIVATE_KEY//\//\\/}
	escSERVER_PUBLIC_KEY=${SERVER_PUBLIC_KEY//\//\\/}
	escCLIENT_PRIVATE_KEY=${CLIENT_PRIVATE_KEY//\//\\/}
	escCLIENT_PUBLIC_KEY=${CLIENT_PUBLIC_KEY//\//\\/}


	cp tmpl.client.conf ${CLIENT_NAME}.conf

	sed -i "s/PEER_PRIVATE_KEY/${escCLIENT_PRIVATE_KEY}/" ${CLIENT_NAME}.conf
	sed -i "s/SERVER_PUBLIC_KEY/${escSERVER_PUBLIC_KEY}/" ${CLIENT_NAME}.conf
	sed -i "s/IP_ADDR/${escCLIENT_IP_ADDR}/" ${CLIENT_NAME}.conf
	sed -i "s/my.ddns.example.com:51820/${Endpoint}/" ${CLIENT_NAME}.conf

	wg set wg0 peer ${CLIENT_PUBLIC_KEY} allowed-ips ${CLIENT_IP_ADDR}
	wg-quick save wg0

	qrencode -t ansiutf8 < ${CLIENT_NAME}.conf


	exit 0;

fi



