##install COREUI & express##
FROM node:12.19.0

ENV NPM_CONFIG_LOGLEVEL warn

# Install all dependencies of the current project.
COPY package.json package.json
RUN npm install

#install express
RUN npm install -g express-gateway

# Copy local files into the image.
COPY src $HOME/src
COPY .storybook $HOME/.storybook
COPY stories $HOME/stories
COPY rollup.config.js $HOME/rollup.config.js
COPY babel.config.js $HOME/babel.config.js
COPY jest.config.js $HOME/jest.config.js
COPY npm-postinstall.js $HOME/npm-postinstall.js 

# Build for production.
RUN npm run build --production 

##install camunda##
FROM camunda/camunda-bpm-platform:latest

##expose ports##
EXPOSE 8081 9876 3000 5000
