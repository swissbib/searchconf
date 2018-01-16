#!/usr/bin/env bash

ZK_BASE1=/usr/local/swissbib/zookeeper1
ZK_RUN=$ZK_BASE1/bin


for host in sb-uzk1.swissbib.unibas.ch sb-uzk2.swissbib.unibas.ch sb-uzk3.swissbib.unibas.ch
do
    ssh swissbib@$host "source ~/ZKDEFS.sh; cd $ZK_RUN; ./zkServer.sh stop"



done
