#!/usr/bin/env bash

set -euo pipefail

DB_FILE=/etc/powerdns/powerdns.sqlite3

if [ ! -e /etc/powerdns/powerdns.sqlite3 ]
then
    echo "creating default database"
    sqlite3 /etc/powerdns/powerdns.sqlite3 < /usr/share/pdns-backend-sqlite3/schema/schema.sqlite3.sql
fi

# Create config file from template
envtpl < /pdns.conf.tpl > /etc/powerdns/pdns.d/site.conf

exec "$@"
