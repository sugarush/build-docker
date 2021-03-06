FROM alpine:3.5

ENV INSTALL_PATH="/usr/local/bin"

ENV PKG="ca-certificates" \
    PKG_TMP="g++ git go" \
    PKG_CACHE="/var/cache/apk"

ENV BUILD_LIB="github.com/coreos/etcd"

ENV BUILD_URL="https://${BUILD_LIB}.git" \
    BUILD_TAG="v3.1.0" \
    BUILD_DIR="/build"

ENV GOPATH="/go"

# running all these steps together builds a smaller image
RUN mkdir -p ${GOPATH} && \
    apk update && \
    apk add ${PKG} && \
    apk add ${PKG_TMP} && \
    git clone ${BUILD_URL} ${BUILD_DIR} && \
    git -C ${BUILD_DIR} checkout tags/${BUILD_TAG} && \
    go get ${BUILD_LIB} && \
    rm ${GOPATH}/bin/* && \
    go install -v ${BUILD_DIR}/etcdctl && \
    cp -a ${GOPATH}/bin/* ${INSTALL_PATH} && \
    rm -rf ${GOPATH} && \
    rm -rf ${BUILD_DIR} && \
    apk del --purge ${PKG_TMP} && \
    rm -rf ${PKG_CACHE}/*
