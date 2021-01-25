#!/bin/bash

wg genkey | tee ${1}.key | wg pubkey > ${1}.pub


