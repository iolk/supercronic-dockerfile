Supercronic
===

Minimal docker image used to build [supercronic](https://github.com/aptible/supercronic) and use it in Dockerfiles.

## How to use

### In Dockerfile
```
FROM iolk/supercronic AS supercronic

# Install supercronic
COPY --from=supercronic /usr/bin/supercronic /usr/bin/supercronic
```

| Supercronic version | Tag | Supported archs|
| --- | --- | --- |
| v0.2.25 | latest | `i386`,`arm`,`arm64`,`amd64` |


### Build a different version
```
git clone https://github.com/iolk/supercronic.git \
    && SUPERCRONIC_VERSION=v0.2.23 \
    && docker build -t supercronic:$SUPERCRONIC_VERSION --build-arg="SUPERCRONIC_VERSION=${SUPERCRONIC_VERSION}" .
```

then in dockerfile

```
FROM supercronic:PUT_SUPERCRONIC_VERSION_HERE AS supercronic

# Install supercronic
COPY --from=supercronic /usr/bin/supercronic /usr/bin/supercronic
```