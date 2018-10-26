FROM chambana/base:latest

MAINTAINER Josh King <jking@chambana.net>

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends wget \
                                               ca-certificates \
                                               gnupg2 \
                                               lsb-release && \
    echo deb https://deb.nodesource.com/node_8.x $(lsb_release -sc) main > /etc/apt/sources.list.d/nodesource.list && \
    wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo deb https://dl.yarnpkg.com/debian/ stable main > /etc/apt/sources.list.d/yarn.list && \
    wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    apt-get -qq update && \
    apt-get install -y --no-install-recommends nodejs \
                                               yarn \
                                               build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
