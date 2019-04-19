#!/bin/bash
#
# inc.sh
#

function installation_of_scripts_dependencies(){
    echo -e "${C_YELLOW}Installation of JQ a JSON parser..."
    echo -e "${C_YELLOW}===============================${C_NC}"
    yes | sudo apt-get install jq
}
installation_of_scripts_dependencies


source "${PATH_PROVISION_SHELL}/inc/alerts.inc.sh"
source "${PATH_PROVISION_SHELL}/inc/json.inc.sh"


source "${PATH_PROVISION_SHELL}/inc/provision.inc.sh"
