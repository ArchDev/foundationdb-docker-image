FROM ubuntu:18.10

LABEL maintainer="Arthur Kushka <arhelmus@gmail.com"
LABEL license="MIT License"

RUN apt-get update && apt-get install -y \
	wget \
	dpkg \
    python \
    net-tools

RUN wget https://www.foundationdb.org/downloads/5.2.5/ubuntu/installers/foundationdb-clients_5.2.5-1_amd64.deb \
	&& wget https://www.foundationdb.org/downloads/5.2.5/ubuntu/installers/foundationdb-server_5.2.5-1_amd64.deb

RUN dpkg -i \
	foundationdb-clients_5.2.5-1_amd64.deb \
	foundationdb-server_5.2.5-1_amd64.deb

RUN apt-get --purge remove -y wget

COPY start.sh /usr/bin/start.sh

RUN chmod 755 /usr/bin/start.sh

ENTRYPOINT ["start.sh"]

EXPOSE 4500