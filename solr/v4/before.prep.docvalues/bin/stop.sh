#!/bin/sh

echo "Stop of SOLR version 4.10x \n"

cd ${SOLR_TOMCAT}/bin
./shutdown.sh -force	
