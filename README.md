ansible-vz-wordpress
====================
Playbook создает контейнер на базе Virtuozzo 7 и развертывает в нем окружение на базе CentOS 7+Nginx+PHP-FPM+MariaDB+WordPress

Как это работает?
-----------------
На хостноде с Virtuozzo 7 развертывается контейнер.
В контейнере устанавливается необходимое окружение для работы WordPress.

Для создания нескольких контейнеров можно использовать скрипт `create_cts.sh`, для удаления одного контейнера — `delete_ct.sh`.

Создать контейнер со всем окружением
------------------------------------
```bash
cd /etc/ansible
echo "192.168.0.161 name=wordpress-161" >> hosts
ansible-playbook createct.yml -e "name=wordpress-161 ip=192.168.0.161"
```
Все что остается сделать, это перейти по ссылке `http://wordpress-161.localdomain` и задать логин/пароль администратора сайта.

Создание нескольких контейнеров
-------------------------------
```bash
cd /etc/ansible
./create_cts.sh
How much containers will be created: 3
Available IP's: 5 you want to create 3 containers. Continue.
...
```

Удаление контейнера
-------------------
```bash
cd /etc/ansible
./delete_ct.sh
Print container name: wordpress-161
...
```

Лицензия
--------
[GNU/GPLv3](http://www.gnu.org/licenses/gpl)
