cd /var/www/vhosts/intelligent-dijkstra.82-223-50-168.plesk.page/httpdocs
git stash
git pull origin develop_
php bin/magento cache:clean
php bin/magento cache:flush
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy es_ES -f
php bin/magento s:s:d -f
chown -R www-data ./
chmod -R 777 ./