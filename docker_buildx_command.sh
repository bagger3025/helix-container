#!/bin/bash

docker buildx create --use
docker buildx inspect --bootstrap

docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t bagger3025/helix-container:latest \
  --push .
