#!/usr/bin/env bash

SOLR_BASE=/usr/local/swissbib/solr
SOLR_RUN=${SOLR_BASE}/bin

cd ${SOLR_RUN}
./solr stop -all

