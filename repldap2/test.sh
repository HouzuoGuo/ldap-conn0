#!/bin/bash

set -x

killall -TERM slapd &> /dev/null || true
rm -rf /tmp/ldap* || true
mkdir -p /tmp/ldap1
mkdir -p /tmp/ldap2

test_cleanup() {
        killall -TERM slapd &> /dev/null || true
        rm -rf /tmp/ldap* || true
}

trap test_cleanup EXIT SIGINT SIGTERM

# Prepare LDAP certificates and database
cp ldap.crt /tmp/ldap.crt
cp ldap.key /tmp/ldap.key

/usr/lib/openldap/slapd -d 65 -h 'ldap://linux2:9000/ ldap:///' -f slapd2.conf &> log

