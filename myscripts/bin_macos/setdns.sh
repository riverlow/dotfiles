#!/usr/bin/env bash

if [ "$2" = "dns" ]; then
sudo networksetup -setdnsservers Wi-Fi empty
sudo networksetup -setdnsservers Wi-Fi 192.168.89.64
fi

if [ "$2" = "show" ]; then
    scutil --dns | grep 'nameserver\[[0-9]*\]'
fi

if [ "$2" = "search" ]; then
    networksetup -setsearchdomains Wi-Fi lan
fi

# flush dns cache
sudo killall -HUP mDNSResponder
sudo killall mDNSResponderHelper
sudo dscacheutil -flushcache
