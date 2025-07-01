# TP : Utilisation des templates et handlers

Le but de ce TP est de découvrir le moteur de template jinja, et de déclencher une tache sur un changement d'état.

Documentation officielle du langage

https://jinja.palletsprojects.com/en/3.0.x/

## Création d'un fichier de configuration nginx

Documentations sur les variables

https://jinja.palletsprojects.com/en/3.0.x/templates/#variables

Ecrire un fichier de template et le playbook associé pour générer cette configuration nginx:

```
events {}

http {
  server {
      listen {{ server_port }};

      server_name localhost;

      access_log  /var/log/nginx/access.log;
      error_log  /var/log/nginx/error.log;

      location / {
          proxy_pass         http://localhost:80;
          proxy_redirect     off;

          proxy_set_header   Host             $host;
          proxy_set_header   X-Real-IP        $remote_addr;
          proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
      }
  }
}
```

La variable à définir et remplacer dans le template est :

```
server_port
``` 

Le fichier généré doit être écrit dans /etc/nginx/nginx.conf


## Création d'un handler

Ecrire le code du handler pour recharger automatiquement le service nginx lors d'un changement de configuration.

Changer la valeur de la variable server_port pour déclencher un changement, et vérifier que le service est bien redémarré.

Pour tester que cela fonctionne, accéder depuis un navigateur à l'ip/port d'une machine : http://192.168.56.11:1234

## Configuration Centos

Sur la machine CentOS, SELinux nous empeche nginx d'accéder à httpd. Désactiver SELinux.

- Soit en utilisant une collection de la communauté : https://docs.ansible.com/ansible/latest/collections/ansible/posix/selinux_module.html
- Soit directement sur la machine CentOS avec la commande `setenforce 0` (ne persiste pas après un reboot)