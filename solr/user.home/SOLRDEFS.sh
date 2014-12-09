#!/bin/sh

#please include this into the .bashrc of your Search engine user


#solr und index deployment
export SOLR_BASE=/usr/local/swissbib/solr
export SOLR_VERSIONS=$SOLR_BASE
export SOLR_RUN=${SOLR_BASE}/bin
export SOLR_CONFIGS=${SOLR_BASE}/configs
export SOLR_HOME=${SOLR_CONFIGS}/solr.home
export SOLR_HOME_CONF=${SOLR_HOME}/bib/conf
export SOLR_TOMCAT=${SOLR_BASE}/tomcat
export SOLR_INDEX_BASE=/swissbib_index
export SOLR_CORE=${SOLR_BASE}/core
export SOLR_INDEX=${SOLR_INDEX_BASE}/solrIndexBiblio



#document processing
export SOLR_DOCPROCBASE=${SOLR_INDEX_BASE}/solrDocumentProcessing
export SOLR_MARC=${SOLR_DOCPROCBASE}/MarcToSolr
export SOLR_MARC_SCRIPT=${SOLR_DOCPROCBASE}/MarcToSolr/dist
export SOLR_FREQUENT=${SOLR_DOCPROCBASE}/FrequentInitialPreProcessing/