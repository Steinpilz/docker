#!/bin/sh

# Build image, run test commands, remove container
docker run --rm $(docker build -q .) \
  /bin/sh -c \
  " \
  mono -V; \
  "