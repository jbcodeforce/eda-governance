#/bin/bash
ATLAS_BASE_URL=http://localhost:21000/api/atlas/v2

echo " Delete type " $1
cat >out <<EOF
{ "entityDefs": 
    [
        { "name": "$1"}
    ]
}
EOF
curl -v -u admin:admin -X DELETE -H "Content-Type: application/json" -H "Accept: application/json" "${ATLAS_BASE_URL}/types/typedefs" -d @./out
