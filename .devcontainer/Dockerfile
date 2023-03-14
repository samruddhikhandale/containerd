FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        gperf \
        dmsetup \
        bc \
        software-properties-common \
        libseccomp-dev \
        btrfs-progs \
        xfsprogs \
        lsof \
        iptables \
        autoconf \
        automake \
        g++ \
        libtool \
        unzip \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:criu/ppa && \
    apt-get update && \
    apt-get install -y criu && \
    rm -rf /var/lib/apt/lists/*

ENV GITHUB_WORKSPACE=""
ENV ENABLE_CRI_SANDBOXES=""
ENV CONTAINERD_RUNTIME="io.containerd.runc.v2"
ENV TEST_RUNTIME="io.containerd.runc.v2"

COPY contrib/Dockerfile.test.d/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt