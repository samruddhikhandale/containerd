FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

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
        unzip \
        lvm2 \
        inotify-tools \
        entr \
        udev \
        systemd \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:criu/ppa && \
    apt-get update && \
    apt-get install -y criu && \
    rm -rf /var/lib/apt/lists/*

COPY .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt