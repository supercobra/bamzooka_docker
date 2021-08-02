#!/bin/bash

# check there is one argument input
if [ $# -lt 1 ]
  echo "$0 <image_name>"
  exit 1
fi


FULLNAME=$1
echo "Pushing to docker.com: $FULLNAME"
docker image push $FULLNAME

# update launcher script with new version
sed -i 's:image="supercobra/bamzooka.*:image="$FULLNAME":g' ./launcher
git add launcher
git commit -m "Updated image version to $FULLNAME."
git push
echo "+"
echo "|"
echo "|"
echo "|"
echo "| IMAGE pushed to docker.com "
echo "| Updated bamzooka_docker    "
echo "| version and pushed.        "
echo "| version and pushed.        "
echo "| VERSION: $FULLNAME         "
echo "|                            "
echo "+----------> ALL DONE!!!"
sleep 2
set -xe

