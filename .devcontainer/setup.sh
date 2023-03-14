#!/bin/bash
set -eux

export PATH="${GOROOT}:${GOPATH}/bin:${PATH}"
echo $PATH

sudo apt-get update
sudo apt-get install -y gperf dmsetup bc software-properties-common
script/setup/install-seccomp
script/setup/install-runc
script/setup/install-cni $(grep containernetworking/plugins go.mod | awk '{print $2}')
script/setup/install-critools
script/setup/install-failpoint-binaries
script/setup/install-gotestsum
script/setup/install-teststat

sudo add-apt-repository -y ppa:criu/ppa
sudo apt-get update
sudo apt-get install -y criu

make binaries GO_BUILD_FLAGS="-mod=vendor"
sudo -E PATH=$PATH make install
