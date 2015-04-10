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
	bzr


RUN useradd -ms /bin/zsh eclim
ENV HOME /home/eclim
RUN passwd -d eclim
USER eclim
WORKDIR /home/eclim

RUN mkdir -p ~/.vim && \
        touch ~/.vimrc

RUN wget http://downloads.typesafe.com/scalaide-pack/4.0.0.vfinal-luna-211-20150305/scala-SDK-4.0.0-vfinal-2.11-linux.gtk.x86_64.tar.gz
RUN wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/luna/SR2/eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz

RUN tar -zvxf eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz && \
	ls -al && \
	rm eclipse-java-luna-SR2-linux-gtk-x86_64.tar.gz

RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.dltk.core.feature.group
RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.dltk.ruby.feature.group
RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.eclipse.org/releases/luna -installIU org.eclipse.jdt.feature.group
RUN DISPLAY=:1 $HOME/eclipse/eclipse -nosplash -consolelog -debug -application org.eclipse.equinox.p2.director -repository http://download.scala-ide.org/sdk/lithium/e44/scala211/stable/site -installIU org.scala-ide.sdt.feature.feature.group

RUN wget http://heanet.dl.sourceforge.net/project/eclim/eclim/2.4.1/eclim_2.4.1.jar

RUN java -Dvim.files=$HOME/.vim \
         -Declipse.home=$HOME/eclipse \
         -jar eclim_2.4.1.jar install

ENV ZSH $HOME/.oh-my-zsh
RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
RUN cp $ZSH/templates/zshrc.zsh-template ~/.zshrc

RUN curl https://raw.githubusercontent.com/n8han/conscript/master/setup.sh | sh
RUN PATH=$PATH:$HOME/bin/cs
COPY sbt_test.sh $HOME/sbt_test.sh
USER root
RUN chmod 777 $HOME/sbt_test.sh
USER eclim
RUN $HOME/sbt_test.sh
RUN $HOME/bin/cs n8han/giter8 && \
	g8

CMD Xvfb :1 -screen 0 1024x768x24 & DISPLAY=:1 $HOME/eclipse/eclimd -d > /dev/null  2>&1 & tmux -2
