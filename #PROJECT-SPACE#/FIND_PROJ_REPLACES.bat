@echo off

call:find_str "#PROJECT-NAME#"
call:find_str "#GITHUB-ACCOUNT#"
call:find_str "#GITHUB-REPO#"
call:find_str "#PYPI-NAME#"
call:find_str "#PYPI-USERNAME#"
call:find_str "#PYPI-EMAIL#"
call:find_str "#PYPI-AUTHOR#"
call:find_str "#PYPI-DESC#"
call:find_str "#PYPI-SECURE-KEY"
call:find_str "#TRAVIS-CI-ACCOUNT#"
call:find_str "#TRAVIS-CI-NAME#"
call:find_str "#CODECOV_ACCOUNT#"
call:find_str "#CODECOV_NAME#"

goto end

: #########################################
: ##### START OF FUNCTION DEFINITIONS #####
: #########################################
:find_str
set TEXT=%~1

echo ### FINDING '%TEXT%' ###
findstr /S "%TEXT%" *.* | findstr /V "%~n0"
echo[
goto:eof
: #######################################
: ##### END OF FUNCTION DEFINITIONS #####
: #######################################

:end
