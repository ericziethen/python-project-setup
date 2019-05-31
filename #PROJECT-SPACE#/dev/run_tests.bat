@echo off

setlocal

set PROJ_MAIN_DIR=%~dp0..
set PACKAGE_ROOT=#PROJECT-NAME#

set PYTHONPATH=%PYTHONPATH%;%PACKAGE_ROOT%

rem Can use to overwrite pytest.ini
rem set PYTEST_ADDOPTS=""

pytest --rootdir="%PROJ_MAIN_DIR%" --cov="%PACKAGE_ROOT%"
set return_code=%errorlevel%
if %return_code% equ 0 (
    echo *** No Issues Found
    goto exit_ok
) else (
    echo *** Some Issues Found
    goto exit_error
)

rem Some pytest resources
rem https://hackingthelibrary.org/posts/2018-02-09-code-coverage/
rem https://code.activestate.com/pypm/pytest-cov/
rem https://docs.pytest.org/en/latest/usage.html
rem http://blog.thedigitalcatonline.com/blog/2018/07/05/useful-pytest-command-line-options/
rem https://www.patricksoftwareblog.com/python-unit-testing-structuring-your-project/

:exit_error
endlocal
echo exit /B 1
exit /B 1

:exit_ok
endlocal
echo exit /B 0
exit /B 0