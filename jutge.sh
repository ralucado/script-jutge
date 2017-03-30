#!/bin/bash
file=$1
myflags="-std=c++11 -Wall"
g++ ${myflags} ${file} -o binary

for f in ${2}*.inp; do
        echo "processing ${f:0:-4} file"
        ./binary < ${f} > ${f:0:-4}.out
        echo Diferencies en joc de proves $f:
        sdiff -s -E -a ${f:0:-4}.out ${f:0:-4}.cor #| wc -l
        #diff ${f:0:-4}.out ${f:0:-4}.cor
        rm ${f:0:-4}.out
done
rm binary
