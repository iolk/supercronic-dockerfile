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

The table below shows the available tags for different versions of supercronic and the supported architectures:

| Supercronic version | Tag | Supported archs|
| --- | --- | --- |
| v0.2.25 | latest | `i386`,`arm`,`arm64`,`amd64` |


### Building a different version

To build a different version of supercronic, follow these steps:

Clone the repository:

```bash
git clone https://github.com/iolk/supercronic.git
```

Set the SUPERCRONIC_VERSION environment variable to the desired version:

```bash
export SUPERCRONIC_VERSION=v0.2.23
```

Build the Docker image:

```bash
    docker build -t supercronic:$SUPERCRONIC_VERSION --build-arg "SUPERCRONIC_VERSION=${SUPERCRONIC_VERSION}" .
```

Then, in your Dockerfile, use the specific supercronic version as follows:

```
FROM supercronic:PUT_SUPERCRONIC_VERSION_HERE AS supercronic

# Install supercronic
COPY --from=supercronic /usr/bin/supercronic /usr/bin/supercronic
```

If you have any questions or need further assistance, please don't hesitate to ask!