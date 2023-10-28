#!/usr/bin/env bash

sudo networksetup -setdnsservers Wi-Fi empty
sudo networksetup -setdnsservers Wi-Fi 127.0.0.1
# flush dns cache
sudo killall -HUP mDNSResponder
sudo killall mDNSResponderHelper
sudo dscacheutil -flushcache

scutil --dns | grep 'nameserver\[[0-9]*\]'
