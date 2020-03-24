#!/bin/sh

# Build image, run test commands, remove container
docker run --rm $(docker build -q .) \
  /bin/sh -c \
  " \
  git version; \
  skaffold version; \
  helm version --client; \
  kubectl version --client \
  "