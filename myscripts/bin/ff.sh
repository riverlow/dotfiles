#!/usr/local/bin/bash
#
#
name=$(basename "${2}")
name_noext="${name%.*}"
name_ext="${name##*.}"

echo "${name}" "${name_noext}"

if [[ ${1} == "x265" ]]; then

ffmpeg -i "${name}" -c:v libx265 -crf 26 -preset fast -c:a aac -b:a 128k "${name_noext}".mp4

fi



# echo "${name}" "${name_noext}"
#
if [[ ${1} == "mp3" ]]; then

if [[ ${name_ext} == "mkv" || ${name_ext} == "m4a" || ${name_ext} == "mp4" || ${name_ext} == "webm" ]]; then
    ffmpeg -i "${name}" -q:a 0 -map a "${name_noext}".mp3
fi

fi
