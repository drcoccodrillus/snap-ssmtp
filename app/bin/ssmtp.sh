#!/bin/bash

$SNAP/usr/sbin/ssmtp -C $SNAP_DATA/ssmtp.conf "$@"
