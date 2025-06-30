#!/bin/bash
set -e 
set -x


# Changer le "motd" (/etc/motd) (module copy)
ansible all -m copy -a "content='Hello World !!!' dest=/etc/motd" --become

# Installer apache grâce au module yum ou apt (module package ou apt ou dnf)
ansible machines_debian -m package -a "name=apache2 state=present" --become 
ansible machines_centos -m package -a "name=httpd state=present" --become 

# Copier un fichier de la machine cliente vers les machines distantes (fichier html à placer dans /var/www/html/) (module copy)
ansible all -m copy -a "content='Hello World !!!' dest=/var/www/html/index.html" --become


# Démarrer apache (module service)
ansible machines_debian -m service -a "name=apache2 state=started" --become 
ansible machines_centos -m service -a "name=httpd state=started enabled=true" --become 



