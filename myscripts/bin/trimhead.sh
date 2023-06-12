#!/usr/local/bin/bash
#
if [[ $1 == "" ]];then
    echo "Usage: $0 [duration]"
    exit 1;
fi

mkdir trimhead
for i in *.mp3; do
    sox "${i}" trimhead/"${i}" trim "${1}"
done
