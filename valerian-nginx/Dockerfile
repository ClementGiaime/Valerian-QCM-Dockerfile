FROM ubuntu:18.04

ENV GLOBAL_IP "localhost"
ENV PORT_NGINX "80"
ENV NGINX_HOSTNAME "localhost"
ENV NGINX_USE "True"


RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y python3.7 && \
    apt-get install -y python3-pip && \
    python3.7 -m pip install flask==1.0.2 && \
    python3.7 -m pip install lxml==4.2.5 && \
    python3.7 -m pip install requests==2.21.0 && \
    python3.7 -m pip install gunicorn==19.7.1

RUN apt-get install -y nginx

RUN mkdir /srv/rt0704 && git clone https://github.com/ClementGiaime/rt0704 /srv/rt0704

RUN rm /etc/nginx/sites-enabled/default && rm /etc/nginx/sites-available/default

COPY valerian.conf /etc/nginx/sites-available/

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
