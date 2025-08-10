# Use official Node.js LTS image

FROM ghcr.io/puppeteer/puppeteer:24.14.0

# تثبيت Google Chrome المناسب
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 3000
CMD [ "node", "server.js" ]
