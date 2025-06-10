#!/bin/bash

set -e
set -x

# Changer le "motd"
echo 'hello world' > fichier.txt
ansible all -m copy -a "src=fichier.txt dest=/etc/motd" --become

# Installer apache grâce au module yum ou apt
# nom des paquets: debian=apache2, centos=httpd
ansible machines_debian -m apt -a "name=apache2 state=present" --become
ansible machines_centos -m yum -a "name=httpd state=present" --become

# Copier un fichier de la machine cliente vers les machines distantes (fichier html à placer dans /var/www/html/)
echo 'hello' > index.html
ansible all -m copy -a "src=index.html dest=/var/www/html/" --become

# Démarrer apache
ansible machines_debian -m service -a "name=apache2 state=started" --become
ansible machines_centos -m service -a "name=httpd state=started" --become




