#/bin/bash

scriptDir=$(dirname $0)

function defineRelationship {
  ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2
  if [[ -z $1  ]]
  then
    echo "Need an entity definition file as parameter"
    exit 1
  fi
  FNAME=$1
  echo "Post relationship between entities from " $FNAME
  curl -v -s -u admin:admin -X POST -H "Content-Type: application/json" -H "Accept: application/json" $ATLAS_BASE_URL"/relationship" -d @$FNAME | python -m json.tool

}


if [[ $# -eq 1 ]]
then
  defineRelationship $1
else
  defineRelationship $scriptDir/../catalog/entities/kafka/relationships.json
fi