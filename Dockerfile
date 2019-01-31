FROM alpine:3.9

ARG CLI_VERSION

RUN apk add --no-cache --virtual=.build_dependencies wget && \
    wget https://releases.rancher.com/cli2/v${CLI_VERSION}/rancher-linux-amd64-v${CLI_VERSION}.tar.gz && \
    tar -xf rancher-linux-amd64-v${CLI_VERSION}.tar.gz &&  \
    cp rancher-v${CLI_VERSION}/rancher /usr/bin/rancher && \
    chmod a+x /usr/bin/rancher && \
    rm rancher-linux-amd64-v${CLI_VERSION}.tar.gz && \
    rm -rf rancher-v${CLI_VERSION} && \
    apk del .build_dependencies && \
    apk add --no-cache curl

ENTRYPOINT ["/usr/bin/rancher"]