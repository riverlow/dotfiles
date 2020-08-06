#!/usr/local/bin/bash

rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmovies /Volumes/w4/
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lmusic /Volumes/w4/
rsync -avh --progress --exclude-from ~/myscripts/exclude-list.txt ~/lpics /Volumes/w4/
