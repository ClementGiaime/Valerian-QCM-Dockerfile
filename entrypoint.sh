#!/bin/bash
set -e

if [ "$BIND_PORT_QCM" != "" ]; then
  sed -i "s/^BIND_PORT_QCM=.*$/BIND_PORT_QCM=\"$BIND_PORT_QCM\"/g" /srv/rt0704/configuration
fi

if [ "$BIND_PORT_AUTHENTICATION" != "" ]; then
  sed -i "s/^BIND_PORT_AUTHENTICATION=.*$/BIND_PORT_AUTHENTICATION=\"$BIND_PORT_AUTHENTICATION\"/g" /srv/rt0704/configuration
fi

if [ "$BIND_PORT_CORRECTOR" != "" ]; then
  sed -i "s/^BIND_PORT_CORRECTOR=.*$/BIND_PORT_CORRECTOR=\"$BIND_PORT_CORRECTOR\"/g" /srv/rt0704/configuration
fi

if [ "$BIND_PORT_CORRECTOR" != "" ]; then
  sed -i "s/^BIND_PORT_CORRECTOR=.*$/BIND_PORT_CORRECTOR=\"$BIND_PORT_CORRECTOR\"/g" /srv/rt0704/configuration
fi

if [ "$PORT_SERVER_QCM" != "" ]; then
  sed -i "s/^PORT_SERVER_QCM=.*$/PORT_SERVER_QCM=\"$PORT_SERVER_QCM\"/g" /srv/rt0704/configuration
fi

if [ "$PORT_SERVER_CORRECTOR" != "" ]; then
  sed -i "s/^PORT_SERVER_CORRECTOR=.*$/PORT_SERVER_CORRECTOR=\"$PORT_SERVER_CORRECTOR\"/g" /srv/rt0704/configuration
fi


sed -i "s/^ADDRESS_SERVER_QCM=.*$/ADDRESS_SERVER_QCM=\"$GLOBAL_IP\"/g" /srv/rt0704/configuration
sed -i "s/^ADDRESS_SERVER_CORRECTOR=.*$/ADDRESS_SERVER_CORRECTOR=\"$GLOBAL_IP\"/g" /srv/rt0704/configuration

#cat /srv/rt0704/configuration
source /srv/rt0704/configuration
#echo "========================="
#printenv | sort
#echo "========================="

python3.7 /srv/rt0704/Corrector-QCM/app.py &
python3.7 /srv/rt0704/Authentication-QCM/app.py &
exec python3.7 /srv/rt0704/Server-QCM/app.py "$@"
