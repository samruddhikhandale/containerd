FROM  mcr.microsoft.com/devcontainers/base:jammy

RUN apt-get update \
    && apt-get install --no-install-recommends -y rsyslog systemd systemd-cron dmsetup bc lvm2 udev \
    # Fix a bug with common-debian script
    && rm -f /usr/local/bin/systemctl \
    #  Clean up
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        gperf \
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
        inotify-tools \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:criu/ppa && \
    apt-get update && \
    apt-get install -y criu && \
    rm -rf /var/lib/apt/lists/*

COPY .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt

# Not sure if needed
RUN mkdir -p /etc/containerd
COPY contrib/Dockerfile.test.d/cri-in-userns/etc_containerd_config.toml /etc/containerd/config.toml

CMD ["/lib/systemd/systemd", "--system", "--unit=basic.target"]
