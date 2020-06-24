#!/bin/bash
set -eu

chown -R www-data:www-data /var/www

composer install -n --optimize-autoloader --apcu-autoloader --no-scripts

php yii migrate --interactive=0

exec supervisord -c /etc/supervisord.conf