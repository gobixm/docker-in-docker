#!/bin/bash

while getopts ":n:p:" opt; do
    case $opt in
        a) NAME="$OPTARG" ;;
        p) SOURCE="$OPTARG" ;;
    esac
done

cd $SOURCE

pwd

npm run test