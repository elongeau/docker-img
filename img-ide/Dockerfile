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

# installation de giter8
RUN $HOME/bin/cs n8han/giter8
RUN $HOME/bin/g8 fayimora/basic-scala-project --name=test && \
	rm -rf $HOME/test # le projet est initialisé pour télécharger les dépendances de giter8

# Ajout d'un alias pour g8
RUN echo "alias g8='$HOME/bin/g8'" >> $HOME/.zshrc

# installtion de vundle pour vim
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# téléchargement de mon .vimrc
RUN curl https://raw.githubusercontent.com/elongeau/dotfiles/master/vimrc > .vimrc
RUN vim -E -u NONE -S ~/.vimrc +PluginInstall +qall || echo 0

# création d'un répertoire pour les backup des fichiers édités dans vim
RUN mkdir $HOME/.vim-tmp

# Installation de neovim
USER root
RUN git clone https://github.com/neovim/neovim.git
RUN apt-get update && \
    apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip -y --force-yes
WORKDIR $HOME/neovim
RUN make cmake

USER dev
WORKDIR $HOME
VOLUME $HOME
CMD zsh
