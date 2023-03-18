# alpineだとうまくいかない可能性がある
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

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
ENV PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.cabal/bin:/root/.ghcup/bin"
RUN ghcup install ghc 9.2.5 && ghcup set ghc 9.2.5
RUN ghcup install cabal 3.6.2 && ghcup set cabal 3.6.2
RUN ghcup install hls 1.9.0.0 && ghcup set hls 1.9.0.0

WORKDIR /usr/src/app
