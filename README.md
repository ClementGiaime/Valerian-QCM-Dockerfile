# Valerian-QCM-Dockerfile
Conception d'un application de solution de QCM pour le module RT0704

Valerian-QCM possède 3 services, écoutant sur 3 ports différents. Les 3 services sont Server-QCM, Authentication-QCM et Corrector-QCM qui écoute respectivement sur les ports 5000, 5001 et 5002.
## Launch Valerian-QCM

### valerian-dev
The GLOBAL_IP is the IP of host
```bash
docker run -d -p 5000:5000 -p 5002:5002 -e GLOBAL_IP="192.168.168.143" clementgiaime/valerian-dev
```
If you will change the port use :
```bash
docker run -d -p 80:5003 -p 8080:5004 -e GLOBAL_IP="192.168.168.143" \
   -e BIND_PORT_QCM="5003" \
   -e BIND_PORT_CORRECTOR="5004" \
   -e PORT_SERVER_QCM="80" \
   -e PORT_SERVER_CORRECTOR="8080" clementgiaime/valerian-dev
```
### valerian-prod
The GLOBAL_IP is the IP of host
```bash
docker run -d -p 5000:5000 -p 5002:5002 -e GLOBAL_IP="192.168.168.143" clementgiaime/valerian-prod
```
If you will change the port use :
```bash
docker run -d -p 80:5003 -p 8080:5004 -e GLOBAL_IP="192.168.168.143" \
   -e BIND_PORT_QCM="5003" \
   -e BIND_PORT_CORRECTOR="5004" \
   -e PORT_SERVER_QCM="80" \
   -e PORT_SERVER_CORRECTOR="8080" clementgiaime/valerian-prod
```
### valerian-nginx
```bash
docker run -d -p 80:80 clementgiaime/valerian-nginx
```

## Version of python module

## Proxy or not proxy

### Architecture of no proxy

### Architecture of proxy
