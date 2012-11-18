#!/bin/bash

if [ $# != 1 ]; then
    echo "USAGE: $0 /path/to/project/dir/"
    exit
else
    echo "Creating release for $1..."
fi

cd $1
mkdir oshpark_release
cd oshpark_release
cp ../*.cmp "Top Layer.ger"
cp ../*.sol "Bottom Layer.ger"
cp ../*.stc "Top Solder Mask.ger"
cp ../*.sts "Bottom Solder Mask.ger"
cp ../*.plc "Top Silk Screen.ger"
cp ../*.pls "Bottom Silk Screen.ger"
cp ../*.dim "Board Outline.ger"
cp ../*.drd "Drills.xln"

cd ..
zip oshpark_release.zip oshpark_release/*
rm -rf oshpark_release

echo "DONE creating release package!"