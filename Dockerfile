FROM alpine:latest

RUN apk update && apk add --no-cache curl inotify-tools bash

WORKDIR /app

ENV QBITTORRENT_SERVER=localhost
ENV QBITTORRENT_PORT=8080
ENV QBITTORRENT_USER=admin
ENV QBITTORRENT_PASS=adminadmin
ENV PORT_FORWARDED=tmp/gluetun/forwarded_port

COPY ./start.sh /app/
RUN chmod 770 /app/start.sh

CMD ["/app/start.sh"]
