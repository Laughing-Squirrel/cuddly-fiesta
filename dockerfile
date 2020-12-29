
##camunda#
FROM camunda/camunda-bpm-platform:tomcct-latest as camunda
ADD /camunda/logistics_app_bpmn/target/logistics_app_bpmn.war /camunda/webapps/logistics.war

#expose ports
EXPOSE 8080

##COREUI##
FROM node:12.19.0-alpine3.10 as coreui

ENV NPM_CONFIG_LOGLEVEL warn

#set work directory
WORKDIR /coreui

# Install and configure serve
RUN npm install -g serve

#install dependencies
COPY package.json package.json
RUN npm install

#copy local files into image
COPY . /coreui

#expose ports
EXPOSE 5000 8081

RUN apk add --no-cache \
        bash \
        ca-certificates \
        maven \
        tar \
        wget \
        xmlstarlet

#run production build
RUN npm run build --production .

CMD serve -s build
