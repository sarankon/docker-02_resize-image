FROM debian:jessie

LABEL MAINTAINER="Sarankon Hiranphonkrit"

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 3B87619DF812A63A8C1005C30742918E5C8DA04A
RUN echo "deb http://download.rethinkdb.com/apt jessie main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 2.3.6~0jessie

RUN apt-get update
RUN apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION

# /var/lib/docker/volumns/repo/_data
VOLUME ["/data"]

# default path when execute
WORKDIR /data

# allow all access
CMD ["rethinkdb","--bind","all"]

# private port for map when run container
EXPOSE 8080 28015 29015
