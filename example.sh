#!/bin/bash

set -e

docker build -t builder -f ci/builder-env/Dockerfile .
docker run -it -v /var/run/docker.sock:/var/run/docker.sock builder bash -c "./build.sh && ./test.sh && ./image.sh"