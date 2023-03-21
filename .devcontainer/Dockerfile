# For details, see https://github.com/devcontainers/images/tree/main/src/base-ubuntu
FROM mcr.microsoft.com/devcontainers/base:1-ubuntu-22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        gperf \
        dmsetup \
        bc \
        software-properties-common \
        libseccomp-dev \
        xfsprogs \
        lsof \
        iptables \
        autoconf \
        automake \
        g++ \
        libtool \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:criu/ppa \
    && apt-get update \
    && apt-get install -y criu \
    && rm -rf /var/lib/apt/lists/*

COPY .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt
