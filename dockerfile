##install COREUI##
FROM node:12.19.0
ENV NPM_CONFIG_LOGLEVEL warn

#set work directory
WORKDIR /coreui

#install dependencies
COPY package.json package.json
RUN npm install

#copy local files into image
COPY . /coreui

#build for production
RUN npm run build --production 

# Install `serve` to run the application
RUN npm install -g serve

# Set the command to start the node server
CMD serve -s build

##install camunda##
#FROM camunda/camunda-bpm-platform:latest

##expose ports##
EXPOSE 3000
#EXPOSE 8081 9876

