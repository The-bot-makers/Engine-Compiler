#!/bin/bash

make Makefile TARGET_CPU=$ARCH YANEURAOU_EDITION=YANEURAOU_ENGINE_NNUE COMPILER=$COMP > /dev/null

python builder.py