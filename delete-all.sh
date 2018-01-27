#!/bin/bash

for object in server volume router port subnet network; do
    IDS=$(openstack $object list -f json | jq -r '.[] | .ID')
    echo "$object: $IDS"
    if [ -n "$IDS" ]; then
        openstack $object delete $IDS
    fi
done
