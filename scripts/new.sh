#!/bin/bash
docker build -t haskell-image . && docker compose run --rm haskell-new