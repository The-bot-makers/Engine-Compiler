#!/bin/sh

echo "- Getting latest YaneuraOu..."

if [ -d YaneuraOu/source ]; then
    cd YaneuraOu/source
    make clean > /dev/null
    git pull
else
    git clone --depth 1 https://github.com/yaneurao/YaneuraOu.git
    cd YaneuraOu/source
fi

echo "- Determining CPU architecture..."

ARCH=SSE42
COMP=clang++


echo "- Building YANEURAOU $ARCH ... (patience advised)"

make -f YaneuraOu/source/Makefile -C engine TARGET_CPU=$ARCH YANEURAOU_EDITION=YANEURAOU_ENGINE_NNUE COMPILER=$COMP > /dev/null

cd ../..
mv ./YaneuraOu/source/YaneuraOu-by-gcc .

echo "- Done!"

python builder.py
