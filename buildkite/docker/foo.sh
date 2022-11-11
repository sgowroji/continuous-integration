#!/bin/bash

docker buildx prune -a -f
docker buildx create --name cibuilder --use

docker buildx build --push -f centos7/Dockerfile    --target centos7           --platform linux/arm64,linux/amd64 -t "gcr.io/bazel-public/testing/centos7" centos7

docker buildx stop cibuilder
docker buildx rm cibuilder
