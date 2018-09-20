ARG TAG=amd64
FROM raxetul/alpine-s6-base:$TAG

MAINTAINER Emrah URHAN <raxetul@gmail.com>

RUN apk update && apk add --no-cache \
        postgresql \
      && rm -rf /var/cache/apk/*
COPY service /s6/postgresql-service
RUN chmod +x /s6/postgresql-service/run /s6/postgresql-service/finish \
      && chown root /s6/postgresql-service/run /s6/postgresql-service/finish \
      && mkdir -p /run/postgresql &&chown postgres:postgres  /data /log /run/postgresql \
      && rm -rf /var/cache/apk/*
## Don't setup ENTRYPOINT, it is set to s6 superviser in alpine-s6-base image, see Dockerfile of alpine-s6-base image
