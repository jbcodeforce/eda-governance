#/bin/bash

scriptDir=$(dirname $0)

function defineType {
  ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2
  if [[ -z $1  ]]
  then
    echo "Need a type definition file as parameter"
    exit 1
  fi
  FNAME=$1
  echo "Upload type definition from " $FNAME
  curl -v -s -u admin:admin -X POST -H "Content-Type: application/json" -H "Accept: application/json" $ATLAS_BASE_URL"/types/typedefs" -d @$FNAME | python -m json.tool

}


if [[ $# -eq 1 ]]
then
  defineType $1
else
  # try to keep the order of dependencies
  defineType $scriptDir/../catalog/types/kafka/kafka_broker_def.json
  defineType $scriptDir/../catalog/types/kafka/kafka_cluster_def.json
  defineType $scriptDir/../catalog/types/kafka/kafka_topic_def.json
  defineType $scriptDir/../catalog/types/kafka/kafka_app_def.json
fi