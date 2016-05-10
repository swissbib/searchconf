#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
#echo $DIR
./solr start -s /swissbib_index/solrHome6 -p 8080
