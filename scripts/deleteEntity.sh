#/bin/bash
ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2

if [[ $# -eq 1 ]]
then
  GUID=$1
else
  echo "Need an entity GUID file as parameter"
  exit 1
fi

echo " Delete entity with GUID: " $GUID
curl -v -u admin:admin -X DELETE -H "Content-Type: application/json" -H "Accept: application/json" "${ATLAS_BASE_URL}/entity/guid/$GUID"
