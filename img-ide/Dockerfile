FROM williamyeh/scala:latest 
MAINTAINER elongeau

VOLUME $HOME

# installation de paquet Debian
RUN apt-get update && \
        apt-get install -y --force-yes \
	vim \
	curl \
	cmake \
	zsh \
	git \
	xclip \
	desktop-file-utils \
	expect \
	luajit \
	lua-bitop \
	lua-lpeg \
	tmux \
	libswt-gtk-3-java-gcj \
	xvfb \
	bzr \
  sudo \
  vim-nox \
  vim-gtk \
  vim-gnome \
  vim-athena 

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
ENV ZSH $HOME/.oh-my-zsh
RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
RUN cp $ZSH/templates/zshrc.zsh-template ~/.zshrc

# installation de conscript
RUN curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh
RUN PATH=$PATH:$HOME/bin/cs

RUN $HOME/sbt_test.sh && \
	rm -rf build.sbt target project sbt_test.sh

# installation de giter8
RUN $HOME/bin/cs n8han/giter8
RUN $HOME/bin/g8 n8han/giter8 --name=test && \
	rm -rf $HOME/test # le projet est initialisé pour télécharger les dépendances de giter8

# installtion de neobundle pour vim
RUN curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
# téléchargement de mon .vimrc
RUN curl https://raw.githubusercontent.com/elongeau/dotfiles/master/.vimrc > .vimrc
RUN $HOME/.vim/bundle/neobundle.vim/bin/neoinstall
RUN mkdir $HOME/.vim-tmp

CMD zsh
