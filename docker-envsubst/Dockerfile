FROM docker

# install envsubst
RUN wget https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-Linux-x86_64 -O /usr/bin/envsubst && \
    chmod +x /usr/bin/envsubst

# install docker-compose
RUN apk add --no-cache docker-compose
