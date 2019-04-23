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
        alert_info "Installation of Drupal ${CMS_VERSION} dependencies ..."
        alert_info "$(alert_line)"    
        # Installation of composer dependencies
        # we pull the project but we never build it
        composer --global config process-timeout 2000
        composer install --prefer-dist
        alert_success "Drupal ${CMS_VERSION} dependencies were installed with success..."
        alert_success "$(alert_line)"    
    fi
}

function drupal_install(){
    alert_info "Installation of Drupal ${CMS_VERSION}..."
    alert_info "$(alert_line)"    
    
    if [ $CMS_VERSION == '8' ]; then
        composer create-project drupal-composer/drupal-project:8.x-dev ./ --stability dev --no-interaction
        alert_success "Drupal ${CMS_VERSION} was downloaded with success."    
        drush site-install standard --db-url=mysql://${DB_USER}:${DB_PASS}@localhost/${DB_NAME} --account-name=${ADMIN_USER} --account-pass=${ADMIN_PWD}
    else
        # we install drush in a composer.json
        composer require drush/drush:7.x
        alias drush=${PATH_PUBLIC}vendor/bin/drush
        vendor/bin/drush dl drupal-7.x --drupal-project-rename="${FOLDER_WEB}"
        # vendor/bin/drush site-install standard --db-url=mysql://${DB_USER}:${DB_PASS}@localhost/${DB_NAME} --account-name=${ADMIN_USER} --account-pass=${ADMIN_PWD}
        alert_success "Drupal ${CMS_VERSION} was downloaded with success."    
    fi

    alert_success "Drupal ${CMS_VERSION} has been installed with success."
    alert_success "$(alert_line)"    

}