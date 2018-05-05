FROM debian:jessie

LABEL MAINTAINER="Sarankon Hiranphonkrit"

ENV RETHINKDB_PACKAGE_VERSION 2.3.6~0jessie

# resize image and layer with back slade \ and && tell this line not done
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 3B87619DF812A63A8C1005C30742918E5C8DA04A \
    && echo "deb http://download.rethinkdb.com/apt jessie main" > /etc/apt/sources.list.d/rethinkdb.list \
    && apt-get update \ 
    && apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
    && rm -rf /var/lib/apt/lists/*

# /var/lib/docker/volumns/repo/_data
VOLUME ["/data"]

# default path when execute
WORKDIR /data

# allow all access
CMD ["rethinkdb","--bind","all"]

# private port for map when run container
EXPOSE 8080 28015 29015
