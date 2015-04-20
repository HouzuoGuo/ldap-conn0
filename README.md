# Preparation

1. Prepare two OpenSUSE machines, either physical or virtual.
2. Install OpenLDAP server and client on both machines
3. Assign machine 1 hostname "linux1"
4. Assign machine 2 hostname "linux2"

# Run

1. On machine 1, enter directory repldap1 and run test.sh
2. (Within 30 seconds) on machine 2, enter directory repldap2 and run test.sh
3. On either machine, run ldapconn_mon.sh
4. Observe the appearance of two connection-0s
