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

CMD bash
