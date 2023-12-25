#!/usr/local/bin/bash
#

mediadir=~/lmedia/
if [[ $1 == "movie" ]]; then
    rsync -av --progress  -e ssh "${2}" lu:$mediadir/movies
fi


if [[ $1 == "show" ]]; then
    rsync -av --progress  -e ssh "${2}" lu:$mediadir/shows
fi

