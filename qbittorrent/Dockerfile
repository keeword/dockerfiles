# download and extract qBittorrent-Enhanced-Edition
FROM alpine:latest as builder

WORKDIR /opt

ARG VERSION=4.6.7.10

RUN wget https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-$VERSION/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip && \
    unzip qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip && \
    chmod a+x qbittorrent-nox


# run
FROM alpine:latest

ENV UID=1000
ENV GID=1000
ENV UMASK=022
ENV WEBUI_PORT=8080
ENV PROFILE_DIR=/qBittorrent

RUN apk add --no-cache tzdata libcap su-exec

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY --from=builder /opt/qbittorrent-nox /usr/bin/qbittorrent-nox

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
