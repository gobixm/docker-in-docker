#!/bin/bash

while getopts ":p:" opt; do
    case $opt in        
        p) SOURCE="$OPTARG" ;;
    esac
done

cd $SOURCE

pwd

npm run build