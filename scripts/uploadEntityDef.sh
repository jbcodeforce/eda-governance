#/bin/bash

scriptDir=$(dirname $0)

function defineEntity {
  ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2
  if [[ -z $1  ]]
  then
    echo "Need an entity definition file as parameter"
    exit 1
  fi
  FNAME=$1
  echo "Post entity from " $FNAME
  curl -v -s -u admin:admin -X POST -H "Content-Type: application/json" -H "Accept: application/json" $ATLAS_BASE_URL"/entity/bulk" -d @$FNAME | python -m json.tool

}


if [[ $# -eq 1 ]]
then
  defineEntity $1
else
  # try to keep the order of dependencies
  defineEntity $scriptDir/../catalog/entities/kafka/kafka_brokers.json
  defineEntity $scriptDir/../catalog/entities/kafka/kafka_eda_dev_cluster.json
  defineEntity $scriptDir/../catalog/entities/kafka/kafka_strimzi_cluster.json
  defineEntity $scriptDir/../catalog/entities/kafka/kafka_topic.json
  defineEntity $scriptDir/../catalog/entities/kafka/kafka_app.json
fi