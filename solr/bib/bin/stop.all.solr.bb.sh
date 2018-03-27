#!/usr/bin/env bash

SOLR_BASE=/usr/local/swissbib/solr
SOLR_RUN=${SOLR_BASE}/bin

for host in sb-us11.swissbib.unibas.ch sb-us12.swissbib.unibas.ch sb-us13.swissbib.unibas.ch
do

    ssh swissbib@$host "source .bashrc; cd ${SOLR_RUN}; ./solr stop -all"



done
