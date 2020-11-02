##install COREUI##
FROM node:12.19.0
ENV NPM_CONFIG_LOGLEVEL warn

# Install and configure serve
RUN npm install -g serve

#set work directory
WORKDIR /coreui

#install dependencies
COPY package.json package.json
RUN npm install

#copy local files into image
COPY . /coreui

#build for production
RUN npm run build --production 

#run production build
CMD serve -s build

##install camunda##
FROM camunda/camunda-bpm-platform:latest

##expose ports##
EXPOSE 8081 9876 5000 3000

