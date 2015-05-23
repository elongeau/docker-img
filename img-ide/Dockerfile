FROM elongeau/base 
MAINTAINER elongeau

# ajout du user `dev`
RUN useradd -ms /bin/zsh dev
ENV HOME /home/dev
RUN passwd -d dev

# utilisation du script `sbt_test.sh` pour installer les dépendances sbt
COPY sbt_test.sh $HOME/sbt_test.sh
RUN chmod 777 $HOME/sbt_test.sh

# avec l'utilisateur dev
USER dev
WORKDIR /home/dev

# installation de oh-my-zsh
RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || echo "Don't care of errors"

RUN $HOME/sbt_test.sh && \
	rm -rf build.sbt target project sbt_test.sh

# installation de conscript
RUN curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh
RUN PATH=$PATH:$HOME/bin/cs

VOLUME $HOME
CMD zsh
