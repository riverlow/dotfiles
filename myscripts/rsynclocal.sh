#!/usr/local/bin/bash

targetdir="/Volumes/w4/"

rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmovies ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lshows ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmusic ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lpics ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/ldocs ${targetdir}
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/Documents/Calibre.Library ${targetdir}
