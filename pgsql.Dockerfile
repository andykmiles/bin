RUN apt-get update && apt-get install -y postgresql \
	&& curl -sLJO https://deb.secrethub.io/amd64 \
    && dpkg -i secrethub-cli-amd64.deb \
    && rm secrethub-cli-amd64.deb
