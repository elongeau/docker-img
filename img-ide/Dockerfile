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

USER root

RUN apt-get update && \
        apt-get install -y --force-yes \
	tmux \
	libswt-gtk-3-java-gcj

USER eclim
CMD /bin/zsh
