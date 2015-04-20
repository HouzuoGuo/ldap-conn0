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

sleep 5 && ldapadd -H 'ldap://linux1:9000/' -x -D 'cn=root,dc=ldapdom,dc=net' -wpass -f db.ldif &
/usr/lib/openldap/slapd -d 65 -h 'ldap://linux1:9000/ ldap:///' -f slapd1.conf &> log

