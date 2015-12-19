#!/bin/bash

file=$2
myflags="-std=c++11 -Wall"
g++ ${myflags} ${file} -o binary

if [ "$#" -ge 3 ]; then
	for (( i = 1; i <= $3; i++ )); do
		./binary < ${1}sample-${i}.inp > ${1}sample-${i}.out
		echo Diferencies en joc de proves ${i}:
		sdiff -s -E -a ${1}sample-${i}.out ${1}sample-${i}.cor
	done
else
	./binary < ${1}sample.inp > ${1}sample.out
	echo Diferencies en el joc de proves:
	sdiff -s -E -a ${1}sample.out ${1}sample.cor
fi


