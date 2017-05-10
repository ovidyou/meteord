#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "ovidyou/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "ovidyou/meteord:node-${NODE_VERSION}-base" ovidyou/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "ovidyou/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "ovidyou/meteord:node-${NODE_VERSION}-onbuild" ovidyou/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "ovidyou/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "ovidyou/meteord:node-${NODE_VERSION}-devbuild" ovidyou/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "ovidyou/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "ovidyou/meteord:node-${NODE_VERSION}-binbuild" ovidyou/meteord:binbuild
