#!/bin/bash
#
# json.inc.sh
#

function json_get_key() {
    KEY="${1}"
    echo "$(cat ${FILE_CONFIG} | jq '.'${KEY})"
}