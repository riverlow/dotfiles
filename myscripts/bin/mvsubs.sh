#!/usr/local/bin/bash
#

if [[ $(basename "${1}") != $(basename "$PWD") ]]; then
	exit 1;
	echo not the correct pwd.
fi

cd Subs;

for i in *;do
	for j in ${i}/*English*; do
		mv "${j}" "$(dirname ../${j})_$(basename ${j})";
	done
done
