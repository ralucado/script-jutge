#!/bin/bash

file=$1
myflags="-std=c++11 -Wall"
g++ ${myflags} ${file} -o binary

if [ "$#" -ge 3 ]; then
	for (( i = 1; i <= $3; i++ )); do
		./binary < ${2}sample-${i}.inp > ${2}sample-${i}.out
		echo Diferencies en joc de proves ${i}:
		sdiff -s -E -a ${2}sample-${i}.out ${2}sample-${i}.cor
	done
else
	./binary < ${2}sample.inp > ${2}sample.out
	echo Diferencies en el joc de proves:
	sdiff -s -E -a ${2}sample.out ${2}sample.cor
fi


