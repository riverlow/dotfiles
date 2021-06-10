#!/usr/local/bin/bash

targetdir="/Volumes/w4/"


if [ $# -eq 0 ]; then
    echo "No arguments supplied"
	echo "usage: $0 [all|1|2|3]"
	echo "\n"
	echo "$0 1: rsync doc pic backup"
	echo "$0 2: rsync movies shows music"
	echo "$0 3: rsync books haha secure"
	exit 1;
fi

function rsyncdoc() {

	rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lpics ${targetdir}
	rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/ldocs ${targetdir}
	rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/doc/lbackups ${targetdir}
}


function rsynctv() {
	rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/pool ${targetdir}
	rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmovies ${targetdir}
	rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lshows ${targetdir}
	rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmusic ${targetdir}
}


function rsyncgit() {
	# with --delete
	rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/Documents/firefoxprofile ${targetdir}
	rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/Documents/Calibre.Library ${targetdir}
	rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/Documents/Kindle.Library ${targetdir}
	rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/haha ${targetdir}

	# lsecure
	rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/.didadida/ ${targetdir}/lsecure/dotdidadida/
	rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/.password-store/ ${targetdir}/lsecure/dotpassword-store/

}


if [[ $1 == "1" ]]; then
	rsyncdoc;
fi

if [[ $1 == "2" ]]; then
	rsynctv;
fi


if [[ $1 == "3" ]]; then
	rsyncgit;
fi

if [[ $1 == "all" ]]; then
	rsyncdoc;
	rsynctv;
	rsyncgit;
fi




