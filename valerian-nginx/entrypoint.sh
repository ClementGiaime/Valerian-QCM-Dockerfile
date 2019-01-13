#!/bin/bash
#set -e

sed -i "s/^ADDRESS_SERVER_QCM=.*$/ADDRESS_SERVER_QCM=\"$GLOBAL_IP\"/g" /srv/rt0704/configuration
sed -i "s/^ADDRESS_SERVER_CORRECTOR=.*$/ADDRESS_SERVER_CORRECTOR=\"$GLOBAL_IP\"/g" /srv/rt0704/configuration

sed -i "s/{{PORT}}/$PORT_NGINX/g"  /etc/nginx/sites-available/valerian.conf
sed -i "s/{{HOSTNAME}}/$NGINX_HOSTNAME/g"  /etc/nginx/sites-available/valerian.conf

source /srv/rt0704/configuration
ln -s /etc/nginx/sites-available/valerian.conf /etc/nginx/sites-enabled/valerian.conf
/etc/init.d/nginx start

cd /srv/rt0704/Corrector-QCM
python3.7 -m gunicorn.app.wsgiapp -b "0.0.0.0:$BIND_PORT_CORRECTOR" app:app &

cd /srv/rt0704/Authentication-QCM
python3.7 -m gunicorn.app.wsgiapp -b "0.0.0.0:$BIND_PORT_AUTHENTICATION" app:app &

cd /srv/rt0704/Server-QCM
exec python3.7 -m gunicorn.app.wsgiapp -b "0.0.0.0:$BIND_PORT_QCM" app:app
