#!/bin/bash
#
# variables.inc.sh
#

# Vagrant variables
# ---------------------------------------
DB_NAME="scotchbox"
DB_USER="root"
DB_PASS="root"


# Colors
# ---------------------------------------
C_RED='\033[0;31m'
C_YELLOW='\033[1;33m'
C_NC='\033[0m'              # No Color
C_GREEN='\033[0;32m'
C_BRN='\033[0;33m'
C_BLUE='\033[0;34m'
C_MAGENTA='\033[0;35m'
C_CYAN='\033[0;36m'
C_WHITE='\033[0;97m'

# folders
# ---------------------------------------
FOLDER_WEB="web"


# Filenames
# ---------------------------------------
FILE_A2_OLD_CONF="000-default"
FILE_A2_CUSTOM_CONF="001-custom"
FILE_CONFIG="vagrant.json"

# Path
# ---------------------------------------
PATH_CONFIG="/var/www/${FILE_CONFIG}"
PATH_COMPOSER="/usr/local/bin/composer/"

PATH_PUBLIC="/var/www/public/"
PATH_WEB="${PATH_PUBLIC}${FOLDER_WEB}/"

PATH_PROVISION="/var/www/provision/"
PATH_PROVISION_SHELL="${PATH_PROVISION}shell/"

PATH_A2_CUSTOM_CONF="${PATH_PROVISION}apache/${FILE_A2_CUSTOM_CONF}.conf"
PATH_A2_SITES_AVAILABLE="/etc/apache2/sites-available/"

PATH_VAGRANT="/home/vagrant/"

# Others
# ---------------------------------------
ALERT_LINE="==============================="

# Others
# ---------------------------------------
CMS="drupal"


