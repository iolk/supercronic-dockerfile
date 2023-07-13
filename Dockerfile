FROM golang:1.20-alpine as build

ARG SUPERCRONIC_VERSION=v0.2.25

WORKDIR /go/src/supercronic/

RUN set -eux \
    && apk add --no-cache git \
    && git clone https://github.com/aptible/supercronic.git ./ \
    && git checkout tags/$SUPERCRONIC_VERSION -b $SUPERCRONIC_VERSION-branch \
    && git submodule update --init --recursive \
    && go build -o ./supercronic -ldflags '-s -w' ./main.go \
    && mv ./supercronic /usr/bin/supercronic \
    && /usr/bin/supercronic -test ./integration/hello.crontab

FROM scratch

COPY --from=build --chown=root:root /usr/bin/supercronic /usr/bin/supercronic

ENTRYPOINT ["/usr/bin/supercronic"]