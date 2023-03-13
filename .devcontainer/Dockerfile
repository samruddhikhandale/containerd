FROM mcr.microsoft.com/devcontainers/go:latest

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    gperf \
    dmsetup \
    software-properties-common
    # curl \
    # wget \
    # unzip \
    # btrfs-progs \
    # libbtrfs-dev \
    # make \
    # xfsprogs \
    # libseccomp-dev

RUN mkdirp -p /tmp/scripts
COPY script/setup/* /tmp/scripts

RUN /tmp/scripts/install-seccomp && \
    /tmp/scripts/install-runc && \
    /tmp/scripts/install-cni $(grep containernetworking/plugins go.mod | awk '{print $2}') && \
    /tmp/scripts/install-critools && \
    /tmp/scripts/install-failpoint-binaries && \
    /tmp/scripts/install-gotestsum && \
    /tmp/scripts/install-teststat

RUN sudo add-apt-repository -y ppa:criu/ppa && \
    sudo apt-get update && \
    sudo apt-get install -y criu

COPY .devcontainer/setup-loopback.sh /tmp/setup-loopback.sh
RUN sudo bash /tmp/setup-loopback.sh

# ENV GOBIN ${GOPATH}/bin
# RUN echo "Downloading dev tools..." && \
#     bash /tmp/install-dev-tools
#     # mkdir -p ${GOPATH}/src/google/rpc && \
#     # cp ${GOPATH}/pkg/mod/github.com/gogo/googleapis@v1.4.0/google/rpc/status.proto /usr/local/include/google/rpc 

# RUN echo "Downloading protoc..." && \
#     # mkdir -p ${GOPATH}/src/google/protobuf && \
#     VERSION_LIST="$(curl -sSL -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/protocolbuffers/protobuf/tags" | grep -oP '"name":\s*"v\K[0-9]+\.[0-9]+"' | tr -d '"' | sort -rV )" && \
#     PROTOC_LATEST_VERSION="$(echo "${VERSION_LIST}" | head -n 1)" && \
#     PROTOC_FILE_NAME="protoc-${PROTOC_LATEST_VERSION}-linux-$(uname -m).zip" && \
#     wget -c https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_LATEST_VERSION}/${PROTOC_FILE_NAME} && \
#     unzip ${PROTOC_FILE_NAME} -d /usr/local && \
#     # cp -R /usr/local/include/google/protobuf/* /usr/local/include/google && \
#     mkdir -p /go/src/usr/local/bin /go/src/usr/local/include && \
#     mv /usr/local/bin/protoc /go/src/usr/local/bin/protoc && \
#     mv /usr/local/include/google /go/src/usr/local/include/google && \ 
#     rm -rf ${PROTOC_FILE_NAME}

# RUN echo "Building runc..." && \
#     mkdir -p ${GOPATH}/src/github.com/opencontainers && \
#     cd ${GOPATH}/src/github.com/opencontainers && \
#     git clone --depth=1 https://github.com/opencontainers/runc && \
#     cd runc && \
#     make && \
#     make install

# RUN echo "Installing bucketbunch..." && \
#     go install github.com/estesp/bucketbench@latest

COPY .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt

#  cp -R /go/pkg/mod/github.com/gogo/googleapis@v1.4.0/google/rpc /go/src/google/ workssssss