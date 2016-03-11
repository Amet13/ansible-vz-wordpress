#!/bin/bash

read -p "Print container name: " NAME

ansible-playbook delct.yml -e "name=$NAME"

# Нужно достать IP чтобы удалить из инвентори
#sed -i '/$IP/d' hosts
