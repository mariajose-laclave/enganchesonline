cd /var/www/vhosts/epic-dhawan.82-223-50-168.plesk.page/httpdocs
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento cache:clean
php bin/magento cache:flush
chown -R www-data ./
chmod -R 777 ./