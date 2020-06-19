FROM ubuntu:20.04

RUN apt update &&\
    apt install -y mariadb-client pdns-backend-mysql pdns-server pdns-tools python3-pip &&\
    pip3 install --no-cache-dir envtpl

RUN apt purge -y pdns-backend-bind

# SQLITE3 Setup
#RUN apt install -y sqlite3 pdns-backend-sqlite3 &&\
#    sqlite3 /etc/powerdns/powerdns.sqlite3 < /usr/share/pdns-backend-sqlite3/schema/schema.sqlite3.sql
#ENV PDNS_launch=gsqlite3
#ENV PDNS_gsqlite3-database=/etc/powerdns/powerdns.sqlite3

ENV VERSION=4.2
ENV PDNS_guardian=yes
ENV PDNS_master=yes
ENV PDNS_guardian=yes
ENV PDNS_launch=gmysql

EXPOSE 53 53/udp

COPY pdns.conf.tpl /
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "/usr/sbin/pdns_server" ]
