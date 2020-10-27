##install COREUI & express##
FROM node:12.19.0

ENV NPM_CONFIG_LOGLEVEL warn

# Install all dependencies of the current project.
COPY package.json package.json
RUN npm install

#install express
RUN npm install -g express-gateway

# Copy all local files into the image.
# add contents to folder
ADD src $HOME/src
ADD .storybook $HOME/.storybook
ADD stories $HOME/stories

# Build for production.
RUN npm run build --production 

##install camunda##
FROM camunda/camunda-bpm-platform:latest

##expose ports##
EXPOSE 8081 9876 3000 5000
