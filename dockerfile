
##### EXPRESS #####
FROM node:10-alpine

ENV NODE_ENV production

# Enable chokidar polling so hot-reload mechanism can work on docker or network volumes
ENV CHOKIDAR_USEPOLLING true

WORKDIR /usr/src/app

COPY express/package.json express/package-lock.json /usr/src/app/
RUN npm install

EXPOSE 8081 9876

CMD [ "node", "lib", "index.js" ]

COPY express/. /usr/src/app

##### COREUI #####
FROM node:12.19.0-stretch

# Override the base log level (info).
ENV NPM_CONFIG_LOGLEVEL warn

# Install and configure `serve`.
RUN npm install -g serve
CMD serve -s build
EXPOSE 5000

# Install all dependencies of the current project.
COPY coreui/package.json package.json
COPY coreui/npm-shrinkwrap.json npm-shrinkwrap.json
RUN npm install

# Copy all local files into the image.
COPY coreui/. .

# Build for production.
RUN npm run build --production


##### CAMUNDA #####
FROM alpine:3.10 as builder

ARG VERSION=7.14.0
ARG DISTRO=tomcat
ARG SNAPSHOT=true

ARG EE=false
ARG USER
ARG PASSWORD

ARG MAVEN_PROXY_HOST
ARG MAVEN_PROXY_PORT
ARG MAVEN_PROXY_USER
ARG MAVEN_PROXY_PASSWORD

ARG JMX_PROMETHEUS_VERSION=0.12.0

RUN apk add --no-cache \
        bash \
        ca-certificates \
        maven \
        tar \
        wget \
        xmlstarlet

# Install all dependencies of the current project.
WORKDIR /usr/src/camunda

COPY camunda/settings.xml camunda/download.sh camunda/camunda-run.sh camunda/camunda-tomcat.sh camunda/camunda-wildfly.sh /usr/src/camunda/

RUN /usr/src/camunda/download.sh


##### FINAL IMAGE #####

FROM alpine:3.10

ARG VERSION=7.14.0

ENV CAMUNDA_VERSION=${VERSION}
ENV DB_DRIVER=
ENV DB_URL=
ENV DB_USERNAME=
ENV DB_PASSWORD=
ENV DB_CONN_MAXACTIVE=20
ENV DB_CONN_MINIDLE=5
ENV DB_CONN_MAXIDLE=20
ENV DB_VALIDATE_ON_BORROW=false
ENV DB_VALIDATION_QUERY="SELECT 1"
ENV SKIP_DB_CONFIG=
ENV WAIT_FOR=
ENV WAIT_FOR_TIMEOUT=30
ENV TZ=UTC
ENV DEBUG=false
ENV JAVA_OPTS="-Xmx768m -XX:MaxMetaspaceSize=256m"
ENV JMX_PROMETHEUS=false
ENV JMX_PROMETHEUS_CONF=/camunda/javaagent/prometheus-jmx.yml
ENV JMX_PROMETHEUS_PORT=9404

EXPOSE 8080 8000 9404

# Downgrading wait-for-it is necessary until this PR is merged
# https://github.com/vishnubob/wait-for-it/pull/68
RUN apk add --no-cache \
        bash \
        ca-certificates \
        curl \
        openjdk11-jre-headless \
        tzdata \
        tini \
        xmlstarlet \
    && curl -o /usr/local/bin/wait-for-it.sh \
      "https://raw.githubusercontent.com/vishnubob/wait-for-it/a454892f3c2ebbc22bd15e446415b8fcb7c1cfa4/wait-for-it.sh" \
    && chmod +x /usr/local/bin/wait-for-it.sh

RUN addgroup -g 1000 -S camunda && \
    adduser -u 1000 -S camunda -G camunda -h /camunda -s /bin/bash -D camunda
WORKDIR /camunda
USER camunda

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["./camunda.sh"]

COPY --chown=camunda:camunda --from=builder /camunda .
