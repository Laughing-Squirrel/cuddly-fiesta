##COREUI##
FROM node:12.14.1-alpine3.10 as coreui

LABEL verison="0.0.0.0.0.1" \
      run="docker run -d --name logisticsSF -p 5000:5000 -p 8081:8081 laughing-squirrel\coreui-free-react-admin-template" \
      description="Logistics Storefront Alpha" \
      maintainer="keith@laughingsquirrel.net"
      
ENV NPM_CONFIG_LOGLEVEL warn

#set NPM registry
RUN npm config set registry https://registry.npmjs.org/

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

#retrieve SSL certs
##run wget --no-check-certificate https://insert.ssl.cert.repositiory.here/ca-cert-name.crt -O /etc/ssl/certs/ca-certificates.crt
##run production build

RUN npm run build --production .

CMD serve -s build


##Build Maven

FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# Package maven

FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
