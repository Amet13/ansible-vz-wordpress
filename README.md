ansible-vz-wordpress
====================
Ansible playbook создает контейнер на базе Virtuozzo 7 и развертывает окружение на базе Nginx+PHP-FPM+MariaDB+WordPress

Как это работает?
-----------------
На хостноде с Virtuozzo 7 развертывается контейнер.
В контейнере устанавливается необходимое окружение для работы WordPress.
Все что остается сделать, это перейти по ссылке и задать логин и пароль администратора сайта.

https://raw.githubusercontent.com/Amet13/ansible-vz-wordpress/master/wordpress.png

Планы
-----
* реализовать множественное создание контейнеров с выделенным пулом IP-адресов
* позакрывать все лишнее с помощью IPTables
* динамически добавлять хосты в inventory после их создания

Лицензия
--------
[GNU/GPLv3](http://www.gnu.org/licenses/gpl)
