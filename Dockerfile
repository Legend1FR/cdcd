# Use official Node.js LTS image
FROM node:20-slim

# Install necessary dependencies for Puppeteer/Chrome
RUN apt-get update \
    && apt-get install -y wget ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libcups2 libdbus-1-3 libdrm2 libgbm1 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 xdg-utils --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json ./
COPY package-lock.json ./

# Install dependencies (and Chrome via postinstall)
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the port (default 3000)
EXPOSE 3000

# Start the server
CMD ["npm", "start"]
