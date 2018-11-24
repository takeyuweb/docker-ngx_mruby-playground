#!/bin/bash

lock=/tmp/background.sh.lock
exec 44> $lock
flock --nonblock 44 || exit 0

sleep 10
