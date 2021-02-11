#!/bin/bash

ARCH=SSE42

make Makefile TARGET_CPU=$ARCH YANEURAOU_EDITION=YANEURAOU_ENGINE_NNUE > /dev/null

for filen in $(ls ./engine/);
do
	echo $filen
done;

python builder.py