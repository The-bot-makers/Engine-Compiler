#!/bin/bash

make -j 8 sse

for filen in $(ls .);
do
	echo $filen
done;

python builder.py