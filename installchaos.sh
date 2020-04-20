#!/bin/bash

chaosRoot=/chaos/
chaosRootBin=${chaosRoot}/chaosblade-0.5.0/
command=$1
javaProcess=$2
prepareUid=$3

if [ "$command" == 'install' ];then
    mkdir ${chaosRoot}
    cd ${chaosRoot}
    wget -O chaosblade-0.5.0-linux-amd64.tar.gz https://chaosblade.oss-cn-hangzhou.aliyuncs.com/agent/github/0.5.0/chaosblade-0.5.0-linux-amd64.tar.gz
    tar -zxvf chaosblade-0.5.0-linux-amd64.tar.gz
    cd ${chaosRootBin}
    ./blade prepare jvm --process $1
    ./blade server start --port 22222

elif [ "$command" == 'uninstall' ];then
    cd ${chaosRootBin}
    ./blade server stop
    ./blade revoke $prepareUid
fi
