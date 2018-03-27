#!/usr/bin/env bash

ZK_BASE2=/usr/local/swissbib/zookeeper2
ZK_RUN=$ZK_BASE2/bin


for host in sb-uzk1.swissbib.unibas.ch sb-uzk2.swissbib.unibas.ch sb-uzk3.swissbib.unibas.ch
do
    ssh swissbib@$host "source ~/ZKDEFS.sh; cd $ZK_RUN; ./zkServer.sh stop"



done
