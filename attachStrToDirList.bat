@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

for %%a in (%*) do (
	set arg=%%a
	if "!arg:~0,6!" equ "prefix" set prefix=!arg:~7!
	if "!arg:~0,6!" equ "suffix" set suffix=!arg:~7!
)

if "!prefix!" equ "" if "!suffix!" equ "" (
	echo please specify prefix or suffix.
	echo ex. prefix:aaa sufix:bbb
	exit /b
)

rem echo prefix is [!prefix!]
rem echo suffix is [!suffix!]

set STR=

for /F %%A in ('dir /b /ad /on') do (
	set STR=%prefix% %%A %suffix%
	echo !STR!
)

endlocal
