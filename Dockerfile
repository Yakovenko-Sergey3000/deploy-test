FROM node:latest as base

WORKDIR /app

FROM base as builder

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

CMD ["yarn", "start"]


