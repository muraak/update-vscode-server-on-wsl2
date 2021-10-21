@echo off
set current=pwd
cd %HOMEPATH%
wsl echo "export PATH=\$PATH:'$(pwd)/AppData/Local/Programs/Microsoft VS Code/bin'" ^>^> ~/.bashrc
@REM cd %HOMEPATH%
@REM wsl cat path.tmp ^>^> ~/.bashrc
wsl source ~/.bashrc
