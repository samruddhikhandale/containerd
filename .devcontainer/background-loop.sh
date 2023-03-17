#!/bin/bash

touch /tmp/monitor-2.txt
go-udev -file .devcontainer/rules-2.json -monitor > /tmp/monitor-2.txt 2>&1 &

while inotifywait -e modify /tmp/monitor-2.txt; do losetup -D; done