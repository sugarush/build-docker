FROM alpine:3.5

ENV PATH="/usr/local/bin"

ENV GOPATH="/go"
RUN mkdir ${GOPATH}

ENV PKG="ca-certificates" \
    PKG_TMP="g++ git go godep make"

ENV BUILD_LIB="github.com/mailgun/vulcand"

ENV BUILD_URL="https://${BUILD_LIB}.git" \
    BUILD_TAG="v0.8.0-beta.3" \
    BUILD_DIR="/build"

# running all these steps together builds a smaller image
RUN apk update && \
    apk add ${PKG} && \
    apk add ${PKG_TMP} && \
    git clone ${BUILD_URL} ${BUILD_DIR} && \
    git -C ${BUILD_DIR} checkout tags/${BUILD_TAG} && \
    cd ${BUILD_DIR} && \
    go get ${BUILD_LIB} && \
    rm /go/bin/* && \
    make install && \
    cp -a /go/bin/* ${PATH} && \
    rm -rf /go && \
    rm -rf /build && \
    apk del --purge ${PKG_TMP} && \
    rm -rf /var/cache/apk/* && \
    rm ${PATH}/vbundle
