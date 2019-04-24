#!/bin/bash
#
# provisionning.inc.sh
#

function start_provisionning(){
    alert_info "Provisioning virtual machine..."
    alert_info "${ALERT_LINE}"
    alert_info "You choose to install ${CMS} version ${CONF_CMS_VERSION} with the stack ${CONF_STACK}"
    alert_info "Your project directory will be ${PATH_PUBLIC} and web root ${PATH_PUBLIC}/${FOLDER_WEB}"
    alert_info "It will work on php ${CONF_PHP_BASE_VERSION}"
}

function drupal_provisionning(){
    alert_info "${ALERT_LINE}"
    alert_info "Provisioning Drupal..."
    alert_info "${ALERT_LINE}"

    mkdir -p "${PATH_PUBLIC}"
    cd "${PATH_PUBLIC}"

    if [[ "$(drupal_already_installed)" == "true" ]]; then
        alert_info "Drupal ${CONF_CMS_VERSION} already installed."
        drupal_install_dependencies
    else
        drupal_install
    fi

    alert_success "${ALERT_LINE}"
    alert_success "End Provisioning Drupal..."
    alert_success "${ALERT_LINE}"
}