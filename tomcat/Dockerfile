FROM alpine:3.5

ENV PKG="ca-certificates openjdk8" \
    PKG_TMP="curl" \
    PKG_CACHE="/var/cache/apk"

ENV TOMCAT_VERSION_MAJOR="8" \
    TOMCAT_VERSION_FULL="8.5.11"

ENV CATALINA_HOME="/srv/tomcat"

# running all these steps together builds a smaller image
RUN apk update && \
    apk add ${PKG} && \
    apk add ${PKG_TMP} && \
    curl -LO https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION_MAJOR}/v${TOMCAT_VERSION_FULL}/bin/apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz && \
  curl -LO https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_VERSION_MAJOR}/v${TOMCAT_VERSION_FULL}/bin/apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz.md5 && \
  md5sum -c apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz.md5 && \
  gunzip -c apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz | tar -xf - -C /srv && \
  rm -f apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz apache-tomcat-${TOMCAT_VERSION_FULL}.tar.gz.md5 && \
  ln -s /srv/apache-tomcat-${TOMCAT_VERSION_FULL} ${CATALINA_HOME} && \
  rm -rf /srv/tomcat/webapps/examples /srv/tomcat/webapps/docs && \
    apk del --purge ${PKG_TMP} && \
    rm -rf ${PKG_CACHE}/*

ENTRYPOINT [ "${CATALINA_HOME}/bin/catalina.sh" ]
CMD [ "run" ]
