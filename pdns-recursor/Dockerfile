FROM ubuntu:20.04

RUN apt update &&\
    apt install -y pdns-recursor python3-pip &&\
    pip3 install --no-cache-dir envtpl

#RUN mkdir -p /etc/pdns-recursor/api.d \
#  && chown -R pdns-recursor: /etc/pdns-recursor/api.d

ENV VERSION=4.2
ENV PDNS_daemon=no

EXPOSE 53 53/udp

COPY recursor.conf.tpl /
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/usr/sbin/pdns_recursor" ]

