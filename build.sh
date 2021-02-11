#!/bin/bash

ARCH=SSE42

make Makefile -C . TARGET_CPU=$ARCH YANEURAOU_EDITION=YANEURAOU_ENGINE_NNUE > /dev/null

for filen in $(ls .);
do
	echo $filen
done;

python builder.py