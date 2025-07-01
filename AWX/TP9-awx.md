# TP9 : Découverte d'awx

Le but de ce TP est de découvrir l'interface AWX

## Installation d'AWX

Ouvrir un terminal dans le dossier du TP et lancer la commande : `vagrant up`

Une fois la machine installée et démarrée, ouvrir une connexion ssh avec `vagrant ssh`.

Copier le script fourni "start.sh" dans /home/vagrant, et le lancer : `./start.sh`

Le motd du serveur va vous afficher les étapes à suivre. Lancer `cat /etc/motd` pour les ré-afficher si besoin.

## Connexion et premiers pas

Récupérer le mot de passe du compte admin avec la commande donnée dans le motd, et vous connecter à l'interface. (http://ip-de-la-vm)

Repérer les différents menus de gauche, et aussi du coin supérieur droit.

## Création d'un trousseau de clé et d'un inventaire 

Créer un gestionnaire de clé ssh :

- type machine
- la clé privée qui nous sert à la connexion
- remote user = vagrant

Créer un inventaire, ajouter nos 2 machines virtuelles.

Nous pouvons déjà tester de lancer une commande adhoc depuis AWX. Inventaire -> sélectioner une machine -> Lancer un job (choisir un ping pour commencer)

## Création d'un projet

Créer un projet sourcé depuis git. Ajouter l'URL suivante: 

- https://github.com/mguimard/sib

Et cocher la case "synchro automatique", enrgistrer.

Le projet doit se synchroniser, on peut comparer les identifiants de commit git.

Créer un modèle de job avec :

- notre projet
- notre inventaire
- notre identification
- et aussi un playbook à lancer.

Le modèle est prêt à être lancé. Vérifier les logs d'exécution.

## Création de plusieurs templates et d'un workflow

Pour chaque playbook du dossier "plays", créer un job template.

Créer ensuite le workflow suivant: https://excalidraw.com/#room=b48dd412b0422e578f72,cZyrD5P4q2_Yn78zu0g7pA


