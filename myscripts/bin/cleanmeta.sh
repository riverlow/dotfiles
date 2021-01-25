#!/bin/bash

if [[ -f "${1}" ]]; then

exiftool -all= "${1}"
touch -d "Sun, 29 Feb 2004 16:21:42 -0800" "${1}"
stat "${1}"

fi
