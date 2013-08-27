#!/bin/bash

#example
#./start.slave.sh -mhttp://sb-s15.swissbib.unibas.ch:8080/solr/sb-biblio/replication -p00:59:00

LOGFILE=./START.SOLR.log

function usage()
{
 printf "usage: $0 -m <URL master Server e.g. http://sb-s15.swissbib.unibas.ch:8080/solr/sb-biblio/replication> -p <polling intervall recommended 00:59:00 or 00:79:00 or 00:99:00 >\n"
}

function setTimestamp()
{
    CURRENT_TIMESTAMP=`date +%Y%m%d%H%M%S`
}

function preChecks()
{
    printf "\n\n" >> $LOGFILE
    printf "in preChecks ...\n" >> $LOGFILE

    #-z: the length of string is zero
    [ -z $MASTERURL ]  && usage && exit
    [ -z $POLLINGTIME ] && usage && exit

    #-n: True if the length of "STRING" is non-zero.
    #[ ! -n "$MASTERURL" ] && echo "MASTERURL  is not set" >>$LOGFILE && exit 9
    #[ ! -n "$POLLINGTIME" ] && echo "pollingtime not set" >>$LOGFILE && exit 9

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

    JAVA_OPTS="$JAVA_OPTS -Xms8000m -Xmx12000m   -Dswissbib.master.url=${MASTERURL} -Dswissbib.poll.intervall=${POLLINGTIME}  -Dsolr.data.dir=${SOLR_INDEX_40}   -Dsolr.solr.home=${SOLR_HOME} -Dsolr.lib.swissbib.dir=${SOLR_LIBDIR} "
    export JAVA_OPTS=${JAVA_OPTS}
    echo "starting Slave solr server with JAVA_OPTS:"
    echo ${JAVA_OPTS}

    printf "Starting Slave solr server at   <%s>...\n" ${CURRENT_TIMESTAMP} >> $LOGFILE
    printf "with JAVA_OPTS   ...\n"  >> $LOGFILE

    printf "${JAVA_OPTS}" >> $LOGFILE

    ${SOLR_TOMCAT}/bin/catalina.sh start -server

}

setTimestamp

while getopts :m:p: OPTION;
do
  case $OPTION in
    m) MASTERURL=$OPTARG
    ;;
    p) POLLINGTIME=$OPTARG
    ;;

    *) printf "unknown option -%c\n" $OPTION; usage; exit;;
  esac
done

preChecks
startSolr
