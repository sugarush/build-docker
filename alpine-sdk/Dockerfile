FROM alpine:3.6

ENV PKG="alpine-sdk vim zsh zsh-vcs" \
    PKG_CACHE="/var/cache/apk"

RUN apk update && \
    apk add ${PKG} && \
    rm -rf ${PKG_CACHE}/*

SHELL [ "/bin/zsh" ]

ADD zshrc /etc/zsh

ADD setup-root-user.sh /tmp
RUN /tmp/setup-root-user.sh

ADD add-build-user.sh /tmp
RUN /tmp/add-build-user.sh

ENTRYPOINT [ "/usr/bin/sudo", "--login", "--user" ]
CMD [ "build" ]
