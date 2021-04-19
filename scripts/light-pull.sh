cd /var/www/vhosts/epic-dhawan.82-223-50-168.plesk.page/httpdocs
git stash
git pull origin develop_
php bin/magento cache:clean
php bin/magento cache:flush
php bin/magento setup:static-content:deploy es_ES -f
chown -R www-data ./
chmod -R 777 ./