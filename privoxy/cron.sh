#!/usr/bin/env bash

actualFile="`readlink "$0"`"
cd "`dirname "$actualFile"`"
./adblocklist.sh
./hosts-blacklist.py

rc.d restart privoxy
