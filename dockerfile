
##### EXPRESS #####
##FROM node:10-alpine

##ENV NODE_ENV production

# Enable chokidar polling so hot-reload mechanism can work on docker or network volumes
##ENV CHOKIDAR_USEPOLLING true

##WORKDIR /usr/src/app

##COPY express/package.json express/package-lock.json /usr/src/app/
##RUN npm install

##EXPOSE 8081 9876

##CMD [ "node", "lib", "index.js" ]

##COPY express/. /usr/src/app

##### COREUI #####
FROM node:7.8.0

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
COPY coreui .

# Build for production.
RUN npm run build --production


##### CAMUNDA #####
##FROM camunda/camunda-bpm-platform:latest
