#!/usr/bin/env bash

SOLR_BASE=/usr/local/swissbib/solr
SOLR_RUN=$SOLR_BASE/bin
SOLR_HOME=/swissbib_index/solrHomeLocal
SOLR_HOME_8080=$SOLR_HOME/8080
SOLR_HOME_8081=$SOLR_HOME/8081
SOLR_HOME_8082=$SOLR_HOME/8082


export ZK_HOST='localhost:2181/solr'

cd $SOLR_RUN; ./solr start -c -s $SOLR_HOME_8080 -p 8080 -z ${ZK_HOST}
cd $SOLR_RUN; ./solr start -c -s $SOLR_HOME_8081 -p 8081 -z ${ZK_HOST}
cd $SOLR_RUN; ./solr start -c -s $SOLR_HOME_8082 -p 8082 -z ${ZK_HOST}


