##install COREUI##
FROM node:12.19.0
ENV NPM_CONFIG_LOGLEVEL warn

#set work directory
WORKDIR /coreui

#install dependencies
COPY package.json package.json
RUN npm install

#copy local files into image
COPY . .

#build for production
RUN npm run build --production 

##install camunda##
#FROM camunda/camunda-bpm-platform:latest

##install express##
#FROM node:12.19.0
#ENV NPM_CONFIG_LOGLEVEL warn
#RUN npm install -g express-gateway

##expose ports##
EXPOSE 3000 5000
#EXPOSE 8081 9876
