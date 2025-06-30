# TP2 : Utilisation des différentes commandes Ad hoc en parallèle sur plusieurs nœuds

Le but de ce TP est de savoir exécuter plusieurs commandes ad-hoc sur tous les noeuds de l'inventaire

## Ecriture d'un inventaire

Ecrire l'inventaire des différentes machines pour pouvoir utiliser la commande suivante

```sh
$ ansible my_machines -i inventory -m debug -a "msg=hello"
```

Exemple de déclaration d'une machine vagrant dans inventaire

`machine1 ansible_ssh_host=IP_MACHINE ansible_ssh_port=22 ansible_ssh_private_key_file=/path/to/private_key ansible_ssh_user=vagrant`

L'inventaire devra :

* Séparer dans des groupes les machines debian des machines centos ("machines_debian" et "machines_centos" par exemple)
* Créer un super groupe qui regroupe les machines debian et centos ("toutes_machines" par exemple)

L'inventaire peut être mis dans /etc/ansible/hosts

```
sudo mkdir /etc/ansible
sudo touch /etc/ansible/hosts
```


## Commandes

Réaliser les opérations suivantes à l'aide de commandes ad-hoc (sur toutes les machines)

* Changer le "motd" (/etc/motd) (module copy)
* Installer apache grâce au module yum ou apt (module package ou apt ou dnf)
* Copier un fichier de la machine cliente vers les machines distantes (fichier html à placer dans /var/www/html/) (module copy)
* Démarrer apache (module service)

Sur debian : apache = apache2

Sur centos : apache = httpd

Vérifiez manuellement que apache est bien démarré après le reboot des machines. Si ce n'est pas le cas, utiliser le module service pour l'activer.

