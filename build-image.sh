#!/bin/sh

echo "+=======================+"
echo "| BUILDING DOCKER IMAGE |"
echo "+=======================+"
set -xe
APP=/tmp/bamzooka
rm -rf $APP # remove previous build if any
git clone --depth=1 git@github.com:metadot/metadot-workspace.git $APP
rm -f $APP/apps/bamzooka-backend/log/*
rm -rf $APP/apps/bamzooka-backend/tmp

cp -r $APP ./image/base
ls -l ./image/base
docker build  image/base -t supercobra/bamzooka
set +xe
rm -rf $APP 

echo "+=======================+"
echo "|   IMAGE BUILD DONE    |"
echo "+=======================+"

