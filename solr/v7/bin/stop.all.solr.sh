#!/usr/bin/env bash

SOLR_BASE=/usr/local/swissbib/solr
SOLR_RUN=${SOLR_BASE}/bin

for host in sb-us16.swissbib.unibas.ch sb-us17.swissbib.unibas.ch sb-us18.swissbib.unibas.ch
do

    ssh swissbib@$host "source .bashrc; cd ${SOLR_RUN}; ./solr stop -all"



done
