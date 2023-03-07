FROM mcr.microsoft.com/devcontainers/go:0-1.20-bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    curl \
    wget \
    unzip \
    btrfs-progs \
    libbtrfs-dev \
    make \
    libseccomp-dev

RUN echo "Downloading protoc..." && \
    VERSION_LIST="$(curl -sSL -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/protocolbuffers/protobuf/tags" | grep -oP '"name":\s*"v\K[0-9]+\.[0-9]+"' | tr -d '"' | sort -rV )" && \
    PROTOC_LATEST_VERSION="$(echo "${VERSION_LIST}" | head -n 1)" && \
    PROTOC_FILE_NAME="protoc-${PROTOC_LATEST_VERSION}-linux-$(uname -m).zip" && \
    wget -c https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_LATEST_VERSION}/${PROTOC_FILE_NAME} && \
    sudo unzip ${PROTOC_FILE_NAME} -d /usr/local && \
    rm -rf ${PROTOC_FILE_NAME}

RUN echo "Building runc..." && \
    mkdir -p ${GOPATH}/src/github.com/opencontainers && \
    cd ${GOPATH}/src/github.com/opencontainers && \
    git clone --depth=1 https://github.com/opencontainers/runc && \
    cd runc && \
    make && \
    sudo make install
