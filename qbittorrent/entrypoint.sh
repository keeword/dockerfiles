#! /bin/sh
#
# entrypoint.sh

set -e

[ "${DEBUG}" = "true" ] && set -x

# create profile directory if not exist
if [ ! -d "${PROFILE_DIR}" ]; then
    mkdir -p "${PROFILE_DIR}"
fi

# set timezone
if [ "${TZ}" != "" ]; then
    ln -sf /usr/share/zoneinfo/"${TZ}" /etc/localtime
    echo "${TZ}" > /etc/timezone
fi

# make non root user can bind ports below 1024
setcap CAP_NET_BIND_SERVICE=+eip /usr/bin/qbittorrent-nox

# set umask
umask "${UMASK}"

# run qbittorrent
su-exec ${UID}:${GID} \
    /usr/bin/qbittorrent-nox --webui-port="${WEBUI_PORT}" --profile="${PROFILE_DIR}"
