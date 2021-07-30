#!/bin/bash

FULLNAME="supercobra/bamzooka:2.0.20210730.121131"
wants_to_push="y"
if [ "$wants_to_push" != "[Yy]" ]
then
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

