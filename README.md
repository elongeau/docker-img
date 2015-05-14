# Docker Images

Dépôt pour mon image permettant de faire du dev Scala avec vim.

Il ne contient qu'une seule image, celle-ci est utilisé pour 2 containers :

* data-only : le répertoire `/home/eclim` est le répertoire de travail
* "ide" : le conteneur *applicatif*

# mode d'emploi

Dans `img-ide` :
```bash
$ docker build -t elongeau/ide . # construit l'image
$ docker run -d --name data ide echo "data only container"
$ docker run --rm -it --volumes-from data ide
```
