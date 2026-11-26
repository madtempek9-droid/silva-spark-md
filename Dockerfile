FROM node:20-bookworm

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm cache clean --force && npm install --no-package-lock && npm install -g qrcode-terminal

COPY . .

EXPOSE 3000


CMD ["pm2-runtime", "start", "index.js"]
