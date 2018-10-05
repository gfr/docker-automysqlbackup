# Package
FROM alpine:3.6
MAINTAINER Dmitry Seleznyov <selim013@gmail.com>

RUN apk add --no-cache mysql-client bash pigz

RUN echo "$CRON_SCHEDULE    /usr/local/bin/automysqlbackup" > /etc/crontabs/root

COPY automysqlbackup /usr/local/bin
COPY automysqlbackup.conf /etc/automysqlbackup/

COPY start.sh /usr/local/bin

RUN chmod +x /usr/local/bin/automysqlbackup /usr/local/bin/start.sh

RUN mkdir -p /etc/default

VOLUME /backup
WORKDIR /backup

ENV USERNAME=           \
    PASSWORD=           \
    DBHOST=localhost    \
    DBNAMES=all         \
    BACKUPDIR="/backup" \
    MDBNAMES=           \
    DBEXCLUDE=""        \
    CREATE_DATABASE=yes \
    SEPDIR=yes          \
    DOWEEKLY=6          \
    DRYRUN=0            \
    ROTATION_DAILY=6    \
    ROTATION_WEEKLY=35  \
    ROTATION_MONTHLY=150
    

CMD ["start.sh"]
