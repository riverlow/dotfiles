#!/usr/local/bin/bash
#

if [[ $1 == "movie" ]]; then
    rsync -av --progress  -e ssh "${2}" lu:Movies/localmovies
fi


if [[ $1 == "show" ]]; then
    rsync -av --progress  -e ssh "${2}" lu:Movies/shows
fi

