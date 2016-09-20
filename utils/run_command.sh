#!/bin/sh

command=$1
port=$2

echo "$command" | nc 127.0.0.1 $port
exit $?
