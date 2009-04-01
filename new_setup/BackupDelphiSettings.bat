@echo off

REM ############ Delphi 7 ############

REM Export Editor settings: Color, etc. into a temp file
reg export HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Editor temp1.txt

REM Export Library Path into another temp file
reg export HKEY_CURRENT_USER\Software\Borland\Delphi\7.0\Library temp2.txt

REM Merge the temp files, to create one registry script
copy temp1.txt+temp2.txt ..\D7Settings.reg

REM ############ BDS 2006 ############
REM Same as above: individual exports go in temp files and 
REM must be merged into the reg file
reg export HKEY_CURRENT_USER\Software\Borland\BDS\4.0\Editor temp1.txt
reg export HKEY_CURRENT_USER\Software\Borland\BDS\4.0\Library temp2.txt

copy temp1.txt+temp2.txt ..\BDS2006(4.0)Settings.reg


REM ############ Clean up temp files ############
del temp*.txt

pause