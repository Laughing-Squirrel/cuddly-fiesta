##install camunda##
WORKDIR /camunda
FROM camunda/camunda-bpm-platform:latest

##install COREUI##
FROM node:12.19.0
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

#build for production
RUN npm run build --production 

#run production build
CMD serve -s build

##expose ports##
EXPOSE 5000 8081 9876

