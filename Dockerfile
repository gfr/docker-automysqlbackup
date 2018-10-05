# Package
FROM alpine:3.6
MAINTAINER Dmitry Seleznyov <selim013@gmail.com>

RUN apk add --no-cache mysql-client

RUN echo "$CRON_SCHEDULE    /usr/local/bin/automysqlbackup" > /etc/crontabs/root

COPY automysqlbackup /usr/local/bin

RUN chmod +x /usr/local/bin/automysqlbackup

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
    COMP=gzip           \
    COMMCOMP=no         \
    LATEST=no           \
    MAX_ALLOWED_PACKET= \
    SOCKET=             \
    PREBACKUP=          \
    POSTBACKUP=         \
    ROUTINES=yes        \
    CRON_SCHEDULE=

CMD ["/usr/bin/crond -l 2 -f"]
