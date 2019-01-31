## Maintained by: [the Hevelop Team](https://hevelop.com)

Build rancher-cli specific version container image

```
docker build --build-arg CLI_VERSION=2.0.6 -t hevelop/rancher-cli ./
docker run --rm -v ~/.rancher/cli2.json:/root/.rancher/cli2.json hevelop/rancher-cli apps
```