FROM haskell:9.2.7

WORKDIR /usr/src/app

RUN stack config set system-ghc --global true
