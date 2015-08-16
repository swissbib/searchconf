#!/bin/bash

./bin/solr start -p 8080 -s /swissbib_index/solrIndexBiblio/solr -a '-Dsolr.log=${solr.solr.home}/../logs'
