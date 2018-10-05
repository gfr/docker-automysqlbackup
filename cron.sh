#!/bin/sh

set -e

if [ "${ENABLE_HOURLY -eq 1}" ]; then
    exec /usr/local/bin/automysqlbackup_hourly
else
    exec /usr/local/bin/automysqlbackup
fi
