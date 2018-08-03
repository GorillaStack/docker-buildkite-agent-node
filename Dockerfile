FROM buildkite/agent:ubuntu
MAINTAINER Elliott Spira <elliott@gorillastack.com>

# default to most recent version of nvm (as of 03/08/2018)
ARG nvm_version=0.33.11

# default to a lambda compatible version of node.js
ARG node_version=8.11.3

# export our custom NVM_DIR
ENV NVM_DIR /usr/local/nvm

RUN mkdir ${NVM_DIR}

# Install nvm
RUN curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v${nvm_version}/install.sh \
  | NVM_DIR=/usr/local/nvm bash

# Install a version of node
RUN [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install ${node_version} && nvm install-latest-npm && npm install -g grunt

# Install a secret dependency of phantomjs
RUN apt-get update && apt-get -y install \
  libfontconfig libpng-dev libjpeg-dev \
  build-essential gcc make autoconf libtool pkg-config nasm
