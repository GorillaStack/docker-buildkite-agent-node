FROM buildkite/agent:ubuntu
MAINTAINER Elliott Spira <elliott@gorillastack.com>

# default to most recent version of nvm (at time of creation)
ARG nvm_version=0.32.1

# default to a lambda compatible version of node.js
ARG node_version=4.3.2

# export our custom NVM_DIR
ENV NVM_DIR /usr/local/nvm

# Install nvm
RUN curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v${nvm_version}/install.sh \
  | NVM_DIR=/usr/local/nvm bash

# Install a version of node
RUN [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install ${node_version} && npm install -g grunt

# Install a secret dependency of phantomjs
RUN apt-get update && apt-get -y install libfontconfig
