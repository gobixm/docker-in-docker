#!/bin/bash

set -e

./ci/test.dotnet.sh -p ./Source/Tests

./ci/test.ui.sh -p ./Source/Ui