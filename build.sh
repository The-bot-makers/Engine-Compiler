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

chmod a+x Makefile

echo "- Determining CPU architecture..."

ARCH=SSE42
COMP=clang++


echo "- Building YANEURAOU $ARCH ... (patience advised)"
echo $PWD

make -f ./Makefile TARGET_CPU=$ARCH YANEURAOU_EDITION=YANEURAOU_ENGINE_NNUE COMPILER=$COMP > /dev/null

cd ../..
mv ./YaneuraOu/source/YaneuraOu-by-gcc .

echo "- Done!"

python builder.py
