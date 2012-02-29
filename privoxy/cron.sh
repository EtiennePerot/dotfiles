#!/usr/bin/env bash

cd "`dirname "$0"`"
./adblocklist.sh
./hosts-blacklist.py

rc.d restart privoxy
