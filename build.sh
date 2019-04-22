#!/bin/bash

set -e

./ci/build.dotnet.sh -p ./Source/AppDuo
./ci/build.dotnet.sh -p ./Source/AppUno

./ci/build.ui.sh -p ./Source/Ui