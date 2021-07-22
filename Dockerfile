FROM whitesourcesoftware/ua-base:v2
MAINTAINER fjferrer

ENV NODE_VERSION 16

### Install Node.js (16.x) + NPM (7.x)
RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash && \
    apt-get install -y nodejs build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*


RUN node --version && npm --version