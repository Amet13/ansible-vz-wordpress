ansible-vz-wordpress
====================
This playbook creates OpenVZ-based container with CentOS 7 and Nginx+PHP-FPM+MariaDB+WordPress

It doesn't works with OpenVZ 6, because prlctl used by default.

How it works?
-------------
On OpenVZ 7 host machine creating new container.
Then installing enviroment for WordPress working.

You can use `create_cts.sh` and `delete_ct.sh` scripts for creating and deleting containers.

Variables (see `group_vars/all`)
--------------------------------
* ostemplate: centos-7-x86_64
* osconfig: vswap.256MB
* prlctl: /usr/bin/prlctl
* updatecache: no
* ns: 192.168.0.1
* hostname: "{{ name }}.localdomain"
* password: 123456
* wp_db_name: wordpress
* wp_db_user: wordpress
* wp_db_password: secret

Creating new container with enviroment
--------------------------------------
```bash
cd /etc/ansible
ansible-playbook createct.yml -e "name=wordpress-161 ip=192.168.0.161"
```
After you going to `http://wordpress-161.localdomain` and set admin login/password for WordPress.

Multiple containers creating
----------------------------
```bash
cd /etc/ansible
./create_cts.sh
How much containers will be created: 3
Available IP's: 5. You want to create 3 containers. Continue.
...
```

Containers deleting
-------------------
```bash
cd /etc/ansible
./delete_ct.sh
Print container name: wordpress-161
...
```

License
-------
[GNU GPLv3](http://www.gnu.org/licenses/gpl)
