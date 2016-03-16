#!/bin/bash

read -p "How much containers will be created: " CTS

# IP pool
BEGIN=192.168.0.161
END=192.168.0.170

SUBNET=${BEGIN%.*}
NET1=${BEGIN#$SUBNET.}
NET2=${END#$SUBNET.}
FREEIP=0
ARRAY=()

HOSTS=/etc/ansible/hosts
PLAYBOOK=createct.yml

for ((i=NET1; i<=NET2; i++)); do
    IP=${SUBNET}.$i
    COUNT=`grep "$IP" $HOSTS -c`
    if [[ $COUNT -eq 0  ]]; then
        let "FREEIP++"
        ARRAY+=($IP)
    fi
done

if [[ $CTS -gt $FREEIP ]]; then
    echo Available IP\'s: $FREEIP. You want to create $CTS containers. Exiting.
    exit
else
    echo Available IP\'s: $FREEIP. You want to create $CTS containers. Continue.
fi

DONE=0
for i in "${ARRAY[@]}"; do
    ID=`echo $i | cut -f4 -d "."`
    ansible-playbook $PLAYBOOK -e "name=wordpress-$ID ip=$i"
    let "DONE++"
    if [[ $DONE -eq $CTS ]]; then
        break
    fi
done
