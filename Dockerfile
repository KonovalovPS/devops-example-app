FROM node:20-slim

ENV PATH="$PATH:node_modules/.bin"

RUN apt-get update && apt-get install -y make

WORKDIR /app

COPY package*.json ./
RUN npm ci

RUN npm i -g fastify-cli@5.7.1 pino-pretty@10.0.1

COPY . .

# Старт сервера описывается в scripts внутри package.json
CMD ["npm", "start"]