#!/bin/sh

set -e

#echo "$CRON_SCHEDULE    /usr/local/bin/cron.sh" > /var/spool/cron/crontabs/automysqlbackup

exec crond -f -l 2 -L /dev/stdout

#if [ "${CRON_SCHEDULE}" ]; then
    #exec go-cron -s "0 ${CRON_SCHEDULE}" -- automysqlbackup
#else
#    exec automysqlbackup
#fi
