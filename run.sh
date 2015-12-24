#!/bin/bash
set -e

/etc/init.d/redis-server start

nprobe --zmq "tcp://*:5556" -i none -n none --collector-port 9995 &

exec /usr/local/bin/ntopng -d /var/lib/ntop "$@"