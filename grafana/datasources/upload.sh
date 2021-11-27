#!/bin/bash

for i in *; do \
    curl -X "POST" "https://grafana.zpi.com/api/datasources" \
    -H "Content-Type: application/json" \
     --user admin:admin \
     --data-binary @$i
done
