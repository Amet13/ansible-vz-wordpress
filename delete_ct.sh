#!/bin/bash

read -p "Print container name: " NAME

ansible-playbook delct.yml -e "name=$NAME"
sed -i "/$NAME/d" hosts
