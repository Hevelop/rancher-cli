FROM alpine

ARG CLI_VERSION

RUN apk add --no-cache --virtual=.build_dependencies wget && \
    wget https://releases.rancher.com/cli2/v${CLI_VERSION}/rancher-linux-amd64-v${CLI_VERSION}.tar.gz && \
    tar -xf rancher-linux-amd64-v${CLI_VERSION}.tar.gz &&  \
    cp rancher-v${CLI_VERSION}/rancher /usr/bin/rancher && \
    chmod a+x /usr/bin/rancher && \
    rm rancher-linux-amd64-v${CLI_VERSION}.tar.gz && \
    rm -rf rancher-v${CLI_VERSION} && \
    apk del .build_dependencies && \
    apk add --no-cache curl tini && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["rancher"]