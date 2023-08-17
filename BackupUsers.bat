@echo off

REM In this code it executes a copy of the user's files on the local disk C: inside a folder called bpk_auto.
xcopy "c:\users\%username%" "c:\bkp_auto" /D /E /I /Y /J /C

