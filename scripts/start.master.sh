#!/bin/bash

LOGFILE=./START.SOLR.log

function setTimestamp()
{
    CURRENT_TIMESTAMP=`date +%Y%m%d%H%M%S`
}

function startSolr ()
{

    printf "\n\n" >> $LOGFILE
    printf "in startSolr ...\n" >> $LOGFILE


    #actually we are using the solr.xml configuration for solr cores
    #this is depricated since 4.3 / 4.4 -> more investigation necessary
    #SOLR_INDEX_40=${SOLR_INDEX}/4.3

    #echo "SOLR Index: "${SOLR_INDEX_40}

    ulimit -v unlimited

    JAVA_OPTS="$JAVA_OPTS -Xms8000m -Xmx12000m   -Dswissbib.replication.files=${FILES_TO_REPLICATE}  -Dsolr.data.dir=${SOLR_INDEX_40}   -Dsolr.solr.home=${SOLR_HOME} -Dsolr.lib.swissbib.dir=${SOLR_LIBDIR} "
    #JAVA_OPTS="$JAVA_OPTS -Xms8000m -Xmx12000m   -Dsolr.data.dir=${SOLR_INDEX_40}   -Dsolr.solr.home=${SOLR_HOME} -Dsolr.lib.swissbib.dir=${SOLR_LIBDIR} "
    export JAVA_OPTS=${JAVA_OPTS}
    echo "starting Master solr server with JAVA_OPTS:"
    echo ${JAVA_OPTS}

    printf "Starting Master solr server at   <%s>...\n" ${CURRENT_TIMESTAMP} >> $LOGFILE
    printf "with JAVA_OPTS   ...\n"  >> $LOGFILE

    printf "${JAVA_OPTS}" >> $LOGFILE

    ${SOLR_TOMCAT}/bin/catalina.sh start -server


}

FILES_TO_REPLICATE="schema.xml,solrconfig.4.3.slave.xml,dr_sys_synonyms.txt,timesynonyms.txt,formsynonyms.txt,stopspellwords.txt"

setTimestamp

startSolr
