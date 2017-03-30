FROM alpine:3.5

RUN apk add --no-cache git curl bash jq openssh-client gpgme util-linux pciutils usbutils coreutils binutils findutils grep

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*

ADD scripts/install_git_lfs.sh install_git_lfs.sh
RUN ./install_git_lfs.sh

RUN git clone --depth 1 https://github.com/StackExchange/blackbox
RUN cp blackbox/bin/* /usr/bin
