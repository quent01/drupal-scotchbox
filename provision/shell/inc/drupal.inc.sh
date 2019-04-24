#!/bin/bash
#
# drupal.inc.sh
#

function drupal_already_installed(){
    if [[ $CMS_VERSION == '8' ]]; then
        if [[ -e $FILE_COMPOSER ]]; then
            echo "true"
        fi
        echo "false"
    fi

    if [[ -e /var/www/$PROJECT_DIR/index.php ]]; then
        echo "true"
    fi
    echo "false"
}

function drupal_install_dependencies(){
    if [[ $CMS_VERSION == '8' ]]; then
        alert_info "Installation of Drupal ${CONF_CMS_VERSION} dependencies ..."
        alert_info "${ALERT_LINE}"    
        # Installation of composer dependencies
        composer --global config process-timeout 2000
        composer install --prefer-dist
        alert_success "Drupal ${CONF_CMS_VERSION} dependencies were installed with success..."
        alert_success "${ALERT_LINE}"    
    fi
    
}

function drupal_install(){
    alert_info "Installation of Drupal ${CONF_CMS_VERSION}..."
    alert_info "${ALERT_LINE}"    
    
    if [ $CMS_VERSION == '8' ]; then
        composer create-project drupal-composer/drupal-project:8.x-dev ./ --stability dev --no-interaction
        alert_success "Drupal ${CONF_CMS_VERSION} was downloaded with success."    
        drush site-install standard --db-url=mysql://${CONF_DB_USER}:${CONF_DB_PASS}@localhost/${CONF_DB_NAME} --account-name=${CONF_ADMIN_USER} --account-pass=${CONF_ADMIN_PWD}
    else
        # we install drush in a composer.json
        composer require drush/drush:7.x
        alias drush=${PATH_PUBLIC}vendor/bin/drush
        vendor/bin/drush dl drupal-7.x --drupal-project-rename="${FOLDER_WEB}"
        alert_success "Drupal ${CONF_CMS_VERSION} was downloaded with success."    
        cd "${FOLDER_WEB}"
        yes | ../vendor/bin/drush site-install --notify standard --db-url="mysql://${DB_USER}:${DB_PASS}@localhost/${DB_NAME}" --account-name="${CONF_ADMIN_USER}" --account-pass="${CONF_ADMIN_PWD}"
    fi

    alert_success "Drupal ${CONF_CMS_VERSION} has been installed with success."
    alert_success "${ALERT_LINE}"

}