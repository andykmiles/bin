RUN apt-get update && apt-get install -y openjdk-11-jdk-headless
WORKDIR /opt
RUN wget http://dist.neo4j.org/neo4j-community-4.1.1-unix.tar.gz \
	&& tar -xzvf neo4j-community-4.1.1-unix.tar.gz
	&& rm neo4j-community-4.1.1-unix.tar.gz

# pgsql
#RUN apt-get update && apt-get install -y postgresql

#RUN curl -sLJO https://deb.secrethub.io/amd64 \
#    && dpkg -i secrethub-cli-amd64.deb \
#    && rm secrethub-cli-amd64.deb
