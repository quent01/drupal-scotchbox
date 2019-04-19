#!/bin/bash
#
# provisionning.inc.sh
#

function start_provisionning(){
    echo -e "${C_YELLOW}Provisioning virtual machine...${C_NC}"
    echo -e "${C_YELLOW}===============================${C_NC}"
}

function parse_vagrant_config_file(){
    CMS_VERSION="$(json_get_key 'cms_version')"
    STACK="$(json_get_key 'stack')"
    PROJECT_DIR="$(json_get_key 'project_dir')"
    WEB_ROOT="$(json_get_key 'web_root')"
    PHP_BASE_VERSION="$(json_get_key 'php_base_version')"
    echo -e "${C_YELLOW}You choose to install ${CMS} version ${CMS_VERSION} with the stack ${STACK} ${C_NC}"
    echo -e "${C_YELLOW}Your project directory will be ${PROJECT_DIR} and web root ${WEB_ROOT} ${C_NC}"
    echo -e "${C_YELLOW}It will work on php ${PHP_VERSION} ${C_NC}"
}