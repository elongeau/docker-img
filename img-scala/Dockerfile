FROM williamyeh/scala
MAINTAINER elongeau

RUN apt-get update && \
	apt-get install vim -y --force-yes && \
	apt-get install tree -y --force-yes 

ENV SCALA_DIR /root/scala

#RUN mkdir -p $SCALA_DIR && \
#	chmod 777 $SCALA_DIR

# ENTRYPOINT ["alias ll='ls -l'"]
#WORKDIR $SCALA_DIR

CMD ["sbt","~run"]
