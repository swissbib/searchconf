#!/usr/bin/env bash


export APP_BASE=/usr/local/swissbib
export SOLR_BASE=${APP_BASE}/solr
export SOLR_RUN=${SOLR_BASE}/bin
export SOLR_DATA_BASE=/swissbib_index
export SOLR_HOME=${SOLR_DATA_BASE}/solrHome7

export SOLR_DOCPROCBASE=/swissbib_index/solrDocumentProcessing
if [  -d ${SOLR_DOCPROCBASE} ]
then
    #variables for docprocdocument processing
    export SOLR_MARC=${SOLR_DOCPROCBASE}/MarcToSolr
    export SOLR_MARC_SCRIPT=${SOLR_DOCPROCBASE}/MarcToSolr/dist
    export SOLR_FREQUENT=${SOLR_DOCPROCBASE}/FrequentInitialPreProcessing/


fi

JAVA_HOME=${APP_BASE}/java
PATH=${APP_BASE}/java/bin:.:$PATH