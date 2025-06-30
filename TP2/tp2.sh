#!/bin/bash
set -e 
set -x


# Ensure the motd content is the specified one
ansible all -m copy -a "content='Hello World !!!' dest=/etc/motd" --become

# Ensure that apache package is present
ansible machines_debian -m package -a "name=apache2 state=present" --become 
ansible machines_centos -m package -a "name=httpd state=present" --become 

# Ensure that the content of /var/www/html/index.html is correct
ansible all -m copy -a "content='Hello World !!!' dest=/var/www/html/index.html" --become

# Ensure apache service is started
ansible machines_debian -m service -a "name=apache2 state=started" --become 
ansible machines_centos -m service -a "name=httpd state=started enabled=true" --become 



