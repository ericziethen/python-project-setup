#!/bin/bash

PACKAGE_ROOT=#PROJECT-NAME#
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_MAIN_DIR=$SCRIPT_PATH/..

echo SCRIPT_PATH: $SCRIPT_PATH
echo PROJ_MAIN_DIR: $PROJ_MAIN_DIR
echo PACKAGE_ROOT: $PACKAGE_ROOT

export PYTHONPATH=$PYTHONPATH:$PACKAGE_ROOT

# Can use to overwrite pytest.ini
# set PYTEST_ADDOPTS=""

echo PYTHONPATH: "$PYTHONPATH"

# Test directories are specified in Pytest.ini
pytest --rootdir="$PROJ_MAIN_DIR" --cov="$PACKAGE_ROOT"
return_code=$?

if [[ $return_code -eq  0 ]];
then
    echo "*** No Issues Found"
else
    echo "*** Some Issues Found"
fi

echo "exit $return_code"
exit $return_code