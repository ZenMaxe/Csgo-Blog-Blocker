:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
test&cls
@echo off
SET hosts=%windir%\system32\drivers\etc\hosts
attrib -r %hosts%
echo. >>%hosts%
FOR %%A IN (

blog.counter-strike.net


) DO (
 echo 0.0.0.0 %%A >>%hosts%
)
attrib +r %hosts%

echo Successfully csgo blog Blocked
echo Star Us ON GitHub!
echo github.com/zenmaxe/csgo-blog-blocker
TIMEOUT /T 10
test&cls
echo Testing Csgo Blog
TIMEOUT /T 2
start "" https://www.blog.counter-strike.net






