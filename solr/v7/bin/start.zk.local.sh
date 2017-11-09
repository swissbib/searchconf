#!/usr/bin/env bash

ZK_BASE=/usr/local/swissbib/zookeeper
ZK_RUN=$ZK_BASE/bin

cd $ZK_RUN;
./zkServer.sh start

