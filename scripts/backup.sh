#!/bin/bash
cd /var/www/vhosts/intelligent-dijkstra.82-223-50-168.plesk.page/httpdocs
git stash
git checkout backup
rm -f /var/www/vhosts/intelligent-dijkstra.82-223-50-168.plesk.page/httpdocs/mysqldump.sql
mysqldump -u enganches_user --password=Wje5q?24 enganches_ > /var/www/vhosts/intelligent-dijkstra.82-223-50-168.plesk.page/httpdocs/mysqldump.sql
git add .
git commit -m "Backup"
git push origin backup
git checkout develop_