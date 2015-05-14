FROM williamyeh/scala:latest 
MAINTAINER elongeau

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


RUN useradd -ms /bin/zsh eclim
ENV HOME /home/eclim
RUN passwd -d eclim
COPY sbt_test.sh $HOME/sbt_test.sh
RUN chmod 777 $HOME/sbt_test.sh && rm -rf $HOME/sbt_test.sh

USER eclim
WORKDIR /home/eclim

ENV ZSH $HOME/.oh-my-zsh
RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
RUN cp $ZSH/templates/zshrc.zsh-template ~/.zshrc

RUN curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh
RUN PATH=$PATH:$HOME/bin/cs

RUN $HOME/sbt_test.sh && \
	rm -rf build.sbt target project

RUN $HOME/bin/cs n8han/giter8
RUN $HOME/bin/g8 n8han/giter8 --name=test && \
	rm -rf $HOME/test

RUN curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
RUN curl https://raw.githubusercontent.com/elongeau/dotfiles/master/.vimrc > .vimrc
RUN $HOME/.vim/bundle/neobundle.vim/bin/neoinstall
RUN mkdir $HOME/.vim-tmp

VOLUME $HOME
CMD zsh
