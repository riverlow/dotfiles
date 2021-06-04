#!/usr/local/bin/bash

targetdir="/Volumes/w4/"

rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/pool ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmovies ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lshows ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmusic ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lpics ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/ldocs ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/doc/lbackups ${targetdir}

# with --delete
rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/Documents/firefoxprofile ${targetdir}
rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/Documents/Calibre.Library ${targetdir}
rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/Documents/Kindle.Library ${targetdir}
rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/haha ${targetdir}

# lsecure
rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/.didadida/ ${targetdir}/lsecure/dotdidadida/
rsync -avh --progress --delete --exclude-from ~/myscripts/exclude-list.txt ~/.password-store/ ${targetdir}/lsecure/dotpassword-store/
