#!/bin/bash

while getopts ":n:p:v:" opt; do
    case $opt in
        n) NAME="$OPTARG" ;;
        p) SOURCE="$OPTARG" ;;
        v) VERSION="$OPTARG" ;;
    esac
done

cd $SOURCE

pwd

docker build -t $NAME:$VERSION .