#!/bin/bash

while getopts ":p:" opt; do
    case $opt in
        p) SOURCE="$OPTARG" ;;
    esac
done

cd $SOURCE

pwd

dotnet publish -o ./dist -c Release