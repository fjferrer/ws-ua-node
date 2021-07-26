FROM whitesourcesoftware/ua-base:v2
MAINTAINER fjferrer

ENV NODE_VERSION 16

# WhiteSource UA version 21.6.3
ENV WS_UA_MD5 b897badfeba66a39963717899e327f86

WORKDIR /usr/local/bin/

### Install WhiteSource UA
RUN echo "${WS_UA_MD5}  wss-unified-agent.jar" > wss.md5 && \
    curl -sL https://unified-agent.s3.amazonaws.com/wss-unified-agent.jar -O && \
    md5sum -c wss.md5

### Install Node.js
RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash && \
    apt-get install -y nodejs build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN node --version && npm --version