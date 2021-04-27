<?php
    shell_exec('cd /var/www/vhosts/intelligent-dijkstra.82-223-50-168.plesk.page/httpdocs
        && git stash
        && git pull origin develop_
        && chown -R www-data ./
        && chmod -R 777 ./');