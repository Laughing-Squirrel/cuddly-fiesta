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
