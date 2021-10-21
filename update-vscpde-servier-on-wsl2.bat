@echo off
set /p use_proxy=use proxy?(y/N)
if /i {%use_proxy%}=={y} (goto :setproxy)
goto :main
:setproxy
set /p proxy_url=proxy url:
set proxy=-x %proxy_url% 
:main
code --version | wsl sed -n 2p > uvsow2
set /p commit_id=<uvsow2 && echo commit_id:%commit_id% &&^
del uvsow* &&^
curl -L "https://update.code.visualstudio.com/commit:%commit_id%/server-linux-x64/stable" %proxy% -o vscode-server-linux-x64.tar.gz &&^
wsl dir=$(pwd);^
    cd ~;^
    mv $dir/vscode-server-linux-x64.tar.gz ./;^
    mkdir ~/.vscode-server/bin/%commit_id%;^
    tar zxvf vscode-server-linux-x64.tar.gz -C /home/muraak/.vscode-server/bin/%commit_id% --strip 1;^
    touch ~/.vscode-server/bin/%commit_id%\0;^
