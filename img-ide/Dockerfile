FROM williamyeh/scala:latest
MAINTAINER elongeau

RUN apt-get update && \
        apt-get install xvfb build-essential -y --force-yes && \
	apt-get install apt-utils -y --force-yes && \
	apt-get install curl -y --force-yes && \
	apt-get install zsh -y --force-yes && \ 
	apt-get install git -y --force-yes && \
        apt-get install vim -y --force-yes && \
        apt-get install tree -y --force-yes 

RUN useradd -ms /bin/zsh eclim
ENV HOME /home/eclim
RUN passwd -d eclim
USER eclim
WORKDIR /home/eclim

RUN wget http://sourceforge.net/projects/eclim/files/eclim/2.4.1/eclim_2.4.1.jar/download && \
        mv download eclim_2.4.1.jar
RUN wget http://eclipse.ialto.com/technology/epp/downloads/release/luna/SR1a/eclipse-java-luna-SR1a-linux-gtk-x86_64.tar.gz

CMD bash
