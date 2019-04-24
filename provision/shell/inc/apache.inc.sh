#!/bin/bash
#
# apache.inc.sh
#

function apache_editing_config(){
    alert_info "${ALERT_LINE}"
    alert_info "Activation of custom apache conf ..."
    alert_info "${ALERT_LINE}"
    cp "${PATH_A2_CUSTOM_CONF}" "${PATH_A2_SITES_AVAILABLE}"
    alert_success "Custome apache conf ${PATH_A2_CUSTOM_CONF} was copied to ${PATH_A2_SITES_AVAILABLE}." 
    sudo a2dissite "${FILE_A2_OLD_CONF}"
    sudo a2ensite "${FILE_A2_CUSTOM_CONF}"
    sudo service apache2 restart
    alert_success "Custome apache conf ${FILE_A2_CUSTOM_CONF} was enabled with success and apache was restarted."
    alert_success "${ALERT_LINE}"
}