#!/bin/bash
#
# provision--root.inc.sh
#

source "/var/www/provision/shell/inc/variables.inc.sh"

# By storing the date now, we can calculate the duration of provisioning at the
# end of this script.
start_seconds="$(date +%s)"

# Network Detection
#
# Make an HTTP request to google.com to determine if outside access is available
# to us. If 3 attempts with a timeout of 5 seconds are not successful, then we'll
# skip a few things further in provisioning rather than create a bunch of errors.
if [[ "$(wget --tries=3 --timeout=5 --spider http://google.com 2>&1 | grep 'connected')" ]]; then
	echo -e "${C_YELLOW}Network connection detected...${C_NC}"
	ping_result="Connected"
else
	echo -e "${C_YELLOW}Network connection not detected. Unable to reach google.com...${C_NC}"
	ping_result="Not Connected"
fi


source "${PATH_PROVISION_SHELL}/inc.sh"

start_provisionning

parse_vagrant_config_file


end_seconds="$(date +%s)"
provisionning_time="$(expr $end_seconds - $start_seconds)"
echo -e "${C_YELLOW}Provisioning complete in ${provisionning_time} seconds ${C_NC}"
if [[ $ping_result == "Connected" ]]; then
	echo -e "${C_YELLOW}External network connection established, packages up to date.${C_NC}"
else
	echo -e "${C_YELLOW}No external network available. Package installation and maintenance skipped.${C_NC}"
fi