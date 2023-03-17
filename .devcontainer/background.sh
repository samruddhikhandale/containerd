#!/bin/bash
set -eux

touch /tmp/monitor.txt
go-udev -file .devcontainer/rules.json -monitor > /tmp/monitor.txt 2>&1 &

while inotifywait -e modify /tmp/monitor.txt; do dmsetup mknodes; done
