RUN apt-get install -y libcurl4 openssl liblzma5

USER root
WORKDIR /opt
RUN wget \
    https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian10-4.4.1.tgz

RUN tar -zxvf mongodb-linux-x86_64-debian10-4.4.1.tgz \
	 && rm mongodb-linux-x86_64-debian10-4.4.1.tgz \
	 && ln -s  /opt/mongodb-linux-x86_64-debian10-4.4.1/bin/* /usr/local/bin/ \
	 && mkdir -p /var/lib/mongo \
	 && sudo mkdir -p /var/log/mongodb \
	 && chown vscode /var/lib/mongo \
	 && chown vscode /var/log/mongodb

# redis

#RUN wget https://download.redis.io/redis-stable.tar.gz
#RUN tar -zxvf redis-stable.tar.gz
#RUN rm redis-stable.tar.gz
#WORKDIR /opt/redis-stable
#RUN make & make install
#RUN echo -n | utils/install_server.sh
#RUN chown -R vscode /var/lib/redis
#RUN chown -R vscode /var/log/

# neo4j
#RUN apt-get update && apt-get install -y openjdk-11-jdk-headless
#WORKDIR /opt
#RUN wget http://dist.neo4j.org/neo4j-community-4.1.1-unix.tar.gz
#RUN tar -xzvf neo4j-community-4.1.1-unix.tar.gz
#RUN rm neo4j-community-4.1.1-unix.tar.gz

# pgsql
#RUN apt-get update && apt-get install -y postgresql

#RUN curl -sLJO https://deb.secrethub.io/amd64 \
#    && dpkg -i secrethub-cli-amd64.deb \
#    && rm secrethub-cli-amd64.deb
