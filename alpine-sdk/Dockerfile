FROM alpine:3.6

ENV PKG="alpine-sdk vim zsh" \
    PKG_CACHE="/var/cache/apk"

RUN apk update && \
    apk add ${PKG} && \
    adduser -D build && \
    rm -rf ${PKG_CACHE}/*

SHELL [ "/bin/zsh" ]

ADD add-build-user.sh /tmp
RUN /tmp/add-build-user.sh

ENTRYPOINT [ "/bin/sudo", "-", "build"]
