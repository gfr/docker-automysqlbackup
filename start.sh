#!/bin/sh

set -e

exec crond -f -l 2

#if [ "${CRON_SCHEDULE}" ]; then
    #exec go-cron -s "0 ${CRON_SCHEDULE}" -- automysqlbackup
#else
#    exec automysqlbackup
#fi
