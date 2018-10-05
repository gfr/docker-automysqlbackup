#!/bin/sh

set -e

echo "$CRON_SCHEDULE    /usr/local/bin/automysqlbackup" > /etc/crontabs/automysqlbackup

exec crond -f -l 2

#if [ "${CRON_SCHEDULE}" ]; then
    #exec go-cron -s "0 ${CRON_SCHEDULE}" -- automysqlbackup
#else
#    exec automysqlbackup
#fi
