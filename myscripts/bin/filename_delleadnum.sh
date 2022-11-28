#!/usr/local/bin/bash

for i in *.mp3; do
	
	newfilename=$(echo $i|sed -E 's/^[0-9]+\.\ //'); 
	mv "${i}" "${newfilename}"
done
