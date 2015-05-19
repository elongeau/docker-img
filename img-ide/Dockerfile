FROM elongeau/base 
MAINTAINER elongeau

# ajout du user `eclim`
RUN useradd -ms /bin/zsh eclim
ENV HOME /home/eclim
RUN passwd -d eclim

# utilisation du script `sbt_test.sh` pour installer les dépendances sbt
COPY sbt_test.sh $HOME/sbt_test.sh
RUN chmod 777 $HOME/sbt_test.sh

# avec l'utilisateur eclim
USER eclim
WORKDIR /home/eclim

# installation de oh-my-zsh
RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || echo "Don't care of errors"

VOLUME $HOME
CMD zsh
