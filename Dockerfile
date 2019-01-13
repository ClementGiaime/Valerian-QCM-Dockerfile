FROM ubuntu:18.04

ENV GLOBAL_IP "localhost"

RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y python3.7 && \
    apt-get install -y python3-pip && \
    python3.7 -m pip install flask==1.0.2 && \
    python3.7 -m pip install lxml==4.2.5 && \
    python3.7 -m pip install requests==2.21.0 && \
    python3.7 -m pip install gunicorn==19.7.1

RUN mkdir /srv/rt0704 && git clone https://github.com/ClementGiaime/rt0704 /srv/rt0704

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 5000 5001 5002

ENTRYPOINT ["/entrypoint.sh"]
