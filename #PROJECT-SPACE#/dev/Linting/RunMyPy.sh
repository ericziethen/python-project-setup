#!/bin/bash

MODULE_NAME=#PROJECT-NAME#
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_MAIN_DIR=$SCRIPT_PATH/../..
MODULE_PATH=$PROJ_MAIN_DIR/$MODULE_NAME

echo SCRIPT_PATH: $SCRIPT_PATH
echo PROJ_MAIN_DIR: $PROJ_MAIN_DIR
echo MODULE_PATH: $MODULE_PATH

export MYPYPATH=$MYPYPATH:$PACKAGE_PATH

mypy "$MODULE_PATH"
return_code=$?

if [[ $return_code -eq  0 ]];
then
    echo "*** No Issues Found"
else
    echo "*** Some Issues Found"
fi

exit $return_code