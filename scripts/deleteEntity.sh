#/bin/bash
ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2

echo " Delete entity with GUID: " $1
curl -v -u admin:admin -X DELETE -H "Content-Type: application/json" -H "Accept: application/json" "${ATLAS_BASE_URL}/entity/guid/$1"
