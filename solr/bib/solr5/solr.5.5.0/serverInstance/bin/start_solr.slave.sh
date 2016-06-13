#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

function usage()
{
    printf "usage: $0 -m <URL master Server e.g. http://sb-s15.swissbib.unibas.ch:8080/solr/sbbiblio/replication> -p <polling intervall recommended 00:59:00 or 00:79:00 or 00:99:00 >\n"
}


function setTimestamp()
{
    CURRENT_TIMESTAMP=`date +%Y%m%d%H%M%S`
}



function preChecks()
{
    #-z: the length of string is zero
    [ -z $MASTERURL ]  && usage && exit
    [ -z $POLLINGTIME ] && usage && exit

}




function startSolr ()
{

    ulimit -v unlimited
    ./solr start -s /swissbib_index/solrHome -p 8080 -a "-Dswissbib.master.url=$MASTERURL -Dswissbib.poll.intervall=$POLLINGTIME"

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

