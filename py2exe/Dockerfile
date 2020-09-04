FROM buildpack-deps:stretch

ARG PYVER=2.7.18

# install wine
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends wine wine32 xvfb xauth cabextract winbind \
    && apt-get clean 

# wine settings
ENV WINEPREFIX /wine/
ENV WINEARCH   win32
ENV WINEDEBUG  fixme-all

# install python inside wine
RUN set -x \
    && wget -nv https://www.python.org/ftp/python/$PYVER/python-$PYVER.msi \
    && wine msiexec /qn /a python-$PYVER.msi \
    && rm python-$PYVER.msi \
    && sed -i 's/_windows_cert_stores = .*/_windows_cert_stores = ("ROOT",)/' "$WINEPREFIX/drive_c/Python27/Lib/ssl.py" \
    && echo 'wine '\''C:\Python27\python.exe'\'' "$@"' > /usr/bin/python \
    && echo 'wine '\''C:\Python27\Scripts\pip.exe'\'' "$@"' > /usr/bin/pip \
    && chmod +x /usr/bin/python /usr/bin/pip \
    && while pgrep wineserver >/dev/null; do echo "Waiting for wineserver"; sleep 1; done \
    && rm -rf /tmp/.wine-* \
    && /usr/bin/pip install pywin32 py2exe_py2 

# wine config
ENV WINEPATH="C:\Python27\;C:\Python27\Scripts;C:\windows\system32;C:\windows"

WORKDIR $WINEPREFIX/drive_c
