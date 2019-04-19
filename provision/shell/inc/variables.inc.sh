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
C_MAGENTA='\033[0;35m'*
C_CYAN='\033[0;36m'
C_WHITE='\033[0;97m'

# Path
# ---------------------------------------
PATH_A2_SITES_AVAILABLE="/etc/apache2/sites-available/"
PATH_COMPOSER="/usr/local/bin/composer/"
PATH_PUBLIC="/var/www/public/"
PATH_PROVISION="/var/www/provision/"
PATH_PROVISION_SHELL="${PATH_PROVISION}shell/"
PATH_VAGRANT="/home/vagrant/"

# Filenames
# ---------------------------------------
FILE_CONFIG="/var/www/vagrant.json"
FILE_APACHE_CONF="$PATH_A2_SITES_AVAILABLE/001-tiz.conf"
FILE_COMPOSER="$PATH_PUBLIC/composer.json"
FILE_DRUSH_ALIASES="$PATH_VAGRANT/.drush/aliases.drushrc.php"

# Others
# ---------------------------------------
CMS="drupal"