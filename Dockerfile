FROM debian:bookworm

ARG DEBIAN_FRONTEND=noninteractive
ARG SHELL=/bin/bash

RUN apt update && apt install -y git g++ cmake make libsamplerate0-dev

RUN cd /opt \
    && git clone https://github.com/g4klx/MMDVMHost.git MMDVMHost \
    && cd MMDVMHost \
    && make all \
    && cp MMDVMHost RemoteCommand /usr/local/bin/ \
    && cp MMDVM.ini DMRIds.dat RSSI.dat /usr/local/etc/ \
    && cd .. \
    && rm -rf MMDVMHost

RUN apt remove -y cmake make git && rm -rf /var/cache/apk/*

EXPOSE 80

VOLUME ["/usr/local/etc/", "/var/log/"]

ENTRYPOINT ["MMDVMHost", "/usr/local/etc/MMDVM.ini"]
