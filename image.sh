#!/bin/bash

set -e

VERSION=0.0.0.0-dev

while getopts ":v:" opt; do
    case $opt in
        v) VERSION="$OPTARG" ;;
    esac
done

./ci/image.sh -n uno -p ./Source/AppUno -v $VERSION
./ci/image.sh -n duo -p ./Source/AppDuo -v $VERSION