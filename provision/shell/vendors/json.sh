#!/bin/bash
#
# json.inc.sh
#

function installation_of_shell_dependencies(){
    alert_info "$(alert_line)"
    alert_info "Installation of JQ a JSON parser..."
    alert_info "$(alert_line)"
    yes | sudo apt-get install jq
    alert_success "JQ was installed with success"
}

function json_get_key() {
    KEY="${1}"
    echo "$(cat ${PATH_CONFIG} | jq -r '.'${KEY})"
}

installation_of_shell_dependencies

# JSON VARIABLES
# ---------------------------------------
CONF_CMS_VERSION="$(json_get_key 'cms_version')"
CONF_STACK="$(json_get_key 'stack')"
CONF_LOCALE="$(json_get_key 'locale')"
CONF_TIMEZONE="$(json_get_key 'timezone')"
CONF_PHP_BASE_VERSION="$(json_get_key 'php_base_version')"
CONF_ADMIN_USER="$(json_get_key 'admin.user')";
CONF_ADMIN_PWD="$(json_get_key 'admin.password')";
CONF_ADMIN_EMAIL="$(json_get_key 'admin.email')";
CONF_ADMIN_FIRSTNAME="$(json_get_key 'admin.firstname')";
CONF_ADMIN_LASTNAME="$(json_get_key 'admin.lastname')";