FROM node:20-alpine

USER root

RUN apk add --no-cache git
RUN apk add --no-cache python3 py3-pip make g++
# needed for pdfjs-dist
RUN apk add --no-cache build-base cairo-dev pango-dev

# Install Chromium
RUN apk add --no-cache chromium

ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# You can install a specific version like: flowise@1.0.0
RUN npm install -g flowise

COPY ["docker/CognitoX abcbf0062ede455e84c6d51e1ec13134", "/data/CognitoX"]

WORKDIR /data

CMD "flowise"
