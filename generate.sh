#! /bin/bash

set -euo pipefail
cd "$(dirname "${0}")"

echo "########################################################################################################"
echo "########################################################################################################"
echo "###                                                                                                  ###"
echo "### Generate cloud-init setting files.                                                               ###"
echo "###                                                                                                  ###"
echo "########################################################################################################"
echo "########################################################################################################"

while read -r server; do
    export MACHINE_NAME="${server}"
    echo "===================================================================================================="
    echo "= generating gateway settings a ${server}."
    echo "===================================================================================================="
    docker compose -f network-generator.yml up --remove-orphans
    docker compose -f user-data-generator.yml up --remove-orphans
done < ../gateway-list

while read -r server; do
    export MACHINE_NAME="${server}"
    echo "===================================================================================================="
    echo "= generating external service settings a ${server}."
    echo "===================================================================================================="
    docker compose -f user-data-generator.yml up --remove-orphans
done < ../external-service-list

while read -r server; do
    export MACHINE_NAME="${server}"
    echo "===================================================================================================="
    echo "= generating cluster settings a ${server}."
    echo "===================================================================================================="
    docker compose -f user-data-generator.yml up --remove-orphans
done < ../cluster-list

exit 0
