# syntax=docker/dockerfile:1
FROM node:14-slim as base
RUN <<EOT
    set -e
    apt update
    apt install -y --no-install-recommends python3 unzip curl build-essential git ca-certificates
    mkdir /app
    chown -R node:node /app
    rm -rf /var/lib/apt/lists/*
EOT

FROM base as builder-site

WORKDIR /app
USER node
ENV PYTHON=python3

COPY --chown=node:node . /app/

RUN <<EOT
    set -e
    yarn
    yarn build-storybook -o build
EOT


FROM caddy:2.7-alpine

LABEL maintainer="Plone Foundation <info@plone.org>" \
      org.label-schema.name="quanta" \
      org.label-schema.description="Quanta Public Site" \
      org.label-schema.vendor="kitconcept GmbH"

COPY --from=builder-site /app/build/ /usr/share/caddy/
