RUN wget https://download.redis.io/redis-stable.tar.gz \
	&& tar -zxvf redis-stable.tar.gz \
	&& rm redis-stable.tar.gz

WORKDIR /opt/redis-stable

RUN make & make install \
	&& echo -n | utils/install_server.sh \
	&& chown -R vscode /var/lib/redis \
	&& chown -R vscode /var/log/

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
