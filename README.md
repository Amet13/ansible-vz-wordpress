ansible-vz-wordpress
====================
Playbook создает контейнер на базе Virtuozzo 7 и развертывает в нем окружение на базе CentOS 7+Nginx+PHP-FPM+MariaDB+WordPress

Как это работает?
-----------------
На хостноде с Virtuozzo 7 развертывается контейнер.
В контейнере устанавливается необходимое окружение для работы WordPress.

Запуск
------
Создать один контейнер вручную с указанным IP-адресом и hostname:
```bash
cd /etc/ansible
echo "192.168.0.161 name=wordpress-161" >> hosts
ansible-playbook site.yml -e "name=wordpress-161 ip=192.168.0.161"
```
Все что остается сделать, это перейти по ссылке `http://$name.localdomain` и задать логин/пароль администратора сайта.

Создать несколько контейнеров автоматически:
```bash
cd /etc/ansible
./create_cts.sh
How much containers will be created: 3
Available IP's: 5 you want to create 3 containers. Continue.
...
```

Удалить контейнер:
```bash
cd /etc/ansible
./delete_ct.sh
Print container name: wordpress-161
...
```

Структура
---------
```bash
.
├── ansible.cfg
├── create_cts.sh
├── delct.yml
├── delete_ct.sh
├── group_vars
│   └── all
├── hosts
├── README.md
├── roles
│   ├── common
│   │   └── tasks
│   │       └── main.yml
│   ├── createct
│   │   ├── handlers
│   │   │   └── main.yml
│   │   └── tasks
│   │       └── main.yml
│   ├── delct
│   │   └── tasks
│   │       └── main.yml
│   ├── mariadb
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── templates
│   │       └── my.cnf.j2
│   ├── nginx
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── templates
│   │       └── default.conf.j2
│   ├── php-fpm
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── templates
│   │       └── wordpress.conf
│   ├── sshpass
│   │   └── tasks
│   │       └── main.yml
│   └── wordpress
│       ├── tasks
│       │   └── main.yml
│       └── templates
│           └── wp-config.php
└── site.yml
```

Лицензия
--------
[GNU/GPLv3](http://www.gnu.org/licenses/gpl)
