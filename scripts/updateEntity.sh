#/bin/bash
ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2

if [[ $# -eq 2 ]]
then
  GUID=$1
  FNAME=$2
else
  echo "Need entity GUID and  type definition file as parameter"
  exit 1
fi

echo "Update entity definition"

curl -v -s -u admin:admin -X PUT -H "Content-Type: application/json" -H "Accept: application/json" $ATLAS_BASE_URL"/entity/guid/$GUID" -d @$FNAME | python -m json.tool
