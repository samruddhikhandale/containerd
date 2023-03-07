FROM mcr.microsoft.com/devcontainers/go:0-1.19-bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    curl \
    wget \
    unzip \
    btrfs-progs \
    libbtrfs-dev

RUN echo "Downloading protoc..." && \
    VERSION_LIST="$(curl -sSL -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/protocolbuffers/protobuf/tags" | grep -oP '"name":\s*"v\K[0-9]+\.[0-9]+"' | tr -d '"' | sort -rV )" && \
    PROTOC_LATEST_VERSION="$(echo "${VERSION_LIST}" | head -n 1)" && \
    wget -c https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_LATEST_VERSION}/protoc-${PROTOC_LATEST_VERSION}-linux-$(uname -m).zip && \
    sudo unzip protoc-${PROTOC_LATEST_VERSION}-linux-$(uname -m).zip -d /usr/local