#!/bin/bash

# GHI 9.12.2014
# - FILES_TO_REPLICATE weren't used so I removed the property in the script and the use of this property in solrconfig
# - a little bit clean-up

LOGFILE=${SOLR_TOMCAT}/solrlogs/solr.app.log

function setTimestamp()
{
    CURRENT_TIMESTAMP=`date +%Y%m%d%H%M%S`
}

function startSolr ()
{

    printf "\n\n" >> $LOGFILE
    printf "in startSolr ...\n" >> $LOGFILE

    export SOLR_INDEX = ${SOLR_INDEX_BASE}/solrIndexBiblio


    echo "SOLR Index: "${SOLR_INDEX}

    ulimit -v unlimited

    JAVA_OPTS="$JAVA_OPTS -Xms8000m -Xmx12000m    -Dsolr.data.dir=${SOLR_INDEX}   -Dsolr.solr.home=${SOLR_HOME} -Dsolr.lib.swissbib.dir=${SOLR_CORE} -Dsolr.log.path=$LOGFILE "
    export JAVA_OPTS=${JAVA_OPTS}
    echo "starting Master solr server with JAVA_OPTS:"
    echo ${JAVA_OPTS}

    printf "Starting Master solr server at   <%s>...\n" ${CURRENT_TIMESTAMP} >> $LOGFILE
    printf "with JAVA_OPTS   ...\n"  >> $LOGFILE

    printf "${JAVA_OPTS}" >> $LOGFILE

    ${SOLR_TOMCAT}/bin/catalina.sh start -server


}

setTimestamp

startSolr
