#/bin/bash
ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2

curl -u admin:admin -H "Content-Type: application/json" -H "Accept: application/json" $ATLAS_BASE_URL/search/attribute/?attrName=$2&?typeName=$1 | python -m json.tool