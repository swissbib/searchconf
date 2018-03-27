#!/usr/bin/env bash

SOLR_BASE=/usr/local/swissbib/solr
SOLR_RUN=$SOLR_BASE/bin 
SOLR_HOME=/swissbib_index/solrHome7
export ZK_HOST='sb-uzk1.swissbib.unibas.ch:2181,sb-uzk2.swissbib.unibas.ch:2181,sb-uzk3.swissbib.unibas.ch:2181/solr'


for host in sb-us15.swissbib.unibas.ch sb-us16.swissbib.unibas.ch sb-us17.swissbib.unibas.ch sb-us18.swissbib.unibas.ch
do
    echo "start node: $host"
    ssh swissbib@$host "cd ${SOLR_RUN}; ./solr start -c -t ${SOLR_HOME} -p 8080 -z ${ZK_HOST}"

done
