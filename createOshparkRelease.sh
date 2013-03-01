#!/bin/bash

##########################################
## createOshParkRelease.sh
##
## Initial Build: 6/29/12
## Last Revised: 7/7/12
## Initial Author: Mark Taylor
## Maintained By: Todd Sukolsky
##########################################
## Description:
## This script prepares gerbers for release
## to Osh park by changing file extensions.
##########################################


if [ $# != 1 ]; then
    echo "USAGE: $0 /path/to/project/dir/"
    exit
else
    echo "Creating release for $1..."
fi

cd $1
mkdir oshpark_release
cd oshpark_release
cp ../*.cmp "Top Layer.cmp"
cp ../*.sol "Bottom Layer.sol"
cp ../*.stc "Top Solder Mask.stc"
cp ../*.sts "Bottom Solder Mask.sts"
cp ../*.plc "Top Silk Screen.plc"
cp ../*.pls "BottomSilkScreen.pls"
cp ../*.dim "BoardOutline.gko"
cp ../*.drd "Drills.xln"

cd ..
zip oshpark_release.zip oshpark_release/*
rm -rf oshpark_release

echo "DONE creating release package!"

