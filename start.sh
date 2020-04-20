#!/bin/bash

BLADE_SRC_ROOT=`pwd`


PLUGINS_PATH=plugins

rm -rf plugins
mkdir -p plugins


mvn clean package -Dmaven.test.skip=true -U
cp /d/javaprogram/chaos/chaosblade-exec-jvm/chaosblade-exec-plugin/chaosblade-exec-plugin-*/target/chaosblade-exec-plugin-*.jar plugins
mvn clean assembly:assembly -Dmaven.test.skip=true -U
