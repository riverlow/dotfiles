#!/usr/local/bin/bash
#

mediadir=/Users/${2}/lmedia/
if [[ $1 == "movie" ]]; then
    rsync -av --progress  -e ssh "${3}" lu:$mediadir/movies
fi


if [[ $1 == "show" ]]; then
    rsync -av --progress  -e ssh "${3}" lu:$mediadir/shows
fi

