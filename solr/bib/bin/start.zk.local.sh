#!/usr/bin/env bash

export ZK_BASE=/usr/local/swissbib/zoosolr
export ZK_RUN=$ZK_BASE/bin

cd $ZK_RUN;
./zkServer.sh start

