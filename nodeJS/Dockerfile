FROM node:carbon


ARG PACKAGE=nextepc
ARG VERSION=0.3.3

RUN set -e; \
    cd /usr/src; \
    rm -rf ./$PACKAGE; \
    curl -SLO "https://github.com/acetcom/$PACKAGE/archive/v$VERSION.tar.gz"; \
    tar -xvf v$VERSION.tar.gz; \
    mv ./$PACKAGE-$VERSION/ ./$PACKAGE; \
    apt-get update -y && \
    apt-get install iputils-ping net-tools vim -y

WORKDIR /usr/src/nextepc/webui
RUN npm install && \
    npm run build
CMD npm run start

EXPOSE 3000
COPY index.js /usr/src/nextepc/webui/server/index.js

