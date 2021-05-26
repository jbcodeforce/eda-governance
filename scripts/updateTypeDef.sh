#/bin/bash
ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2

if [[ $# -eq 1 ]]
then
  FNAME=$1
else
  echo "Need a type definition file as parameter"
  exit 1
fi

echo "Update server type definition"

curl -v -s -u admin:admin -X PUT -H "Content-Type: application/json" -H "Accept: application/json" $ATLAS_BASE_URL"/types/typedefs" -d @$FNAME | python -m json.tool
