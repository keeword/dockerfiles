# qbittorrent

[qBittorrent Enhanced Edition](https://github.com/c0re100/qBittorrent-Enhanced-Edition)

## usage

```shell
docker run \
    -e UID=1000 \
    -e GID=1000 \
    -e UMASK=022 \
    -e WEBUI_PORT=8080 \
    -e PROFILE_DIR=/data/downloads/.qbittorrent \
    -v /data:/data \
    keeword/qbittorrent
```

Then set "saved path" and other options through webui.
