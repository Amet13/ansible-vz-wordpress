ansible-vz-wordpress
====================
Playbook создает контейнер на базе Virtuozzo 7 и развертывает в нем окружение на базе Nginx+PHP-FPM+MariaDB+WordPress

Как это работает?
-----------------
На хостноде с Virtuozzo 7 развертывается контейнер.
В контейнере устанавливается необходимое окружение для работы WordPress.

Все что остается сделать, это перейти по ссылке и задать логин и пароль администратора сайта.
![](https://raw.githubusercontent.com/Amet13/ansible-vz-wordpress/master/wordpress.png)

Запуск
------
Создать один контейнер с указанным IP-адресом и hostname:
```bash
cd /etc/ansible
echo 192.168.0.161 >> hosts
ansible-playbook site.yml -e "name=wordpress-1 ip=192.168.0.161"
```

Создать несколько контейнеров:
```bash
cd /etc/ansible
./creatects.sh
How much containers will be created: 3
Available IP's: 5 you want to create 3 containers. Continue.
...
```

Удалить контейнер:
```bash
cd /etc/ansible
ansible-playbook deletect.yml -e "name=wordpress-1"
sed -i '/192.168.0.161/d' hosts
```

Если создаем контейнеры скриптом, то добавлять адреса в hosts не нужно, это сделает сам скрипт.

Лицензия
--------
[GNU/GPLv3](http://www.gnu.org/licenses/gpl)
