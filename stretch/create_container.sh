#!/bin/bash

docker run  -t  -d --privileged --name "stretch-builds" -v /home/ariel/pbuilder:/var/cache/pbuilder -v /home/ariel/git/debs:/root/git/debs -v /home/ariel/pbuild-tmp:/var/tmp/build-area "ariel/devstretch:base"

