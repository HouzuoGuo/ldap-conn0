#!/bin/sh

set -x

while true; do
    clear
    ldapsearch -H 'ldap://linux1:9000' -x -D 'cn=admin,cn=config' -w config -b 'cn=Connections,cn=Monitor' -s children | grep 'cn=Connection'
    ldapsearch -H 'ldap://linux2:9000' -x -D 'cn=admin,cn=config' -w config -b 'cn=Connections,cn=Monitor' -s children | grep 'cn=Connection'
    date
    sleep 10
done

