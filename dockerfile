FROM debian:buster-slim

ENV LANG C.UTF-8

# common haskell + stack dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dpkg-dev \
        git \
        gcc \
        gnupg \
        g++ \
        libc6-dev \
        libffi-dev \
        libgmp-dev \
        libnuma-dev \
        libtinfo-dev \
        make \
        netbase \
        xz-utils \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://get.haskellstack.org/ | sh
ENV PATH="${PATH}:/usr/local/bin/stack:/root/.local/bin"
RUN stack setup 9.2.6

# WORKDIR /usr/src
# RUN git clone https://github.com/haskell/haskell-language-server
# WORKDIR /usr/src/haskell-language-server


WORKDIR /usr/src/app
