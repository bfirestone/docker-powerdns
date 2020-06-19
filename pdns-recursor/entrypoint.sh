#!/usr/bin/env bash

set -euo pipefail

# Configure base vars
: "${PDNS_local_port:=53}"
: "${PDNS_local_address:=0.0.0.0}"
: "${PDNS_allow_from:=0.0.0.0/0}"
: "${PDNS_config_dir:=/etc/powerdns}"
: "${PDNS_hint_file:=/usr/share/dns/root.hints}"
: "${PDNS_include_dir:=/etc/powerdns/recursor.d}"
: "${PDNS_lua_config_file:=/etc/powerdns/recursor.lua}"
: "${PDNS_public_suffix_list_file:=/usr/share/publicsuffix/public_suffix_list.dat}"
#: "${PDNS_quiet:=yes}"
: "${PDNS_setgid:=pdns}"
: "${PDNS_setuid:=pdns}"

export PDNS_local_port
export PDNS_local_address
export PDNS_allow_from
export PDNS_config_dir
export PDNS_hint_file
export PDNS_include_dir
export PDNS_lua_config_file
export PDNS_public_suffix_list_file
#export PDNS_quiet
export PDNS_setgid
export PDNS_setuid

# Create config file from template
envtpl < /recursor.conf.tpl > /etc/powerdns/recursor.conf

# Fix config file ownership
#chown ${pdns_user}: $config_file

exec "$@"
