#!/bin/sh
NAME="supercobra/bamzooka"
echo "+=======================+"
echo "| BUILDING DOCKER IMAGE |"
echo "+=======================+"

echo -n "Do you want to push to docker.com after the build? (y or n)"
read wants_to_push

if [ "$wants_to_push" != "${wants_to_push#[Yy]}" ] ;then
    echo "OK, will push image to docker.com"
    sleep 2
else
    echo "OK, just building then, no pushing anything..."
    sleep 2
fi
set -xe
APP=./image/base/bamzooka
rm -rf $APP # remove previous build if any
git clone --depth=1 git@github.com:metadot/metadot-workspace.git $APP
rm -f $APP/apps/bamzooka-backend/log/*
rm -rf $APP/apps/bamzooka-backend/tmp

VERSION=`date +%Y%m%d.%H%M%S`
BASE_VERSION="2.0"
FULLNAME=$NAME:$BASE_VERSION.$VERSION
docker build  image/base -t $FULLNAME
set +xe
rm -rf $APP

echo "+=======================+"
echo "|   IMAGE BUILD DONE    |"
echo "+=======================+"

if [ "$wants_to_push" != "${wants_to_push#[Yy]}" ] ;then
echo
echo "Pushing to docker.com..."
docker image push $FULLNAME
echo "+"
echo "|"
echo "|"
echo "|"
echo "| IMAGE pushed to docker.com |"
echo "| VERSION: $FULLNAME"
echo "|"
echo "+----------> ALL DONE!!!"
    sleep 2
else
    # nothing
fi
set -xe

