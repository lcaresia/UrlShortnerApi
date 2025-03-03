FROM node:current-stretch

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY ./package.json /usr/src/app
COPY ./package-lock.json /usr/src/app

RUN npm ci

COPY . /usr/src/app

RUN npm run build

ENV NODE_ENV production

CMD [ "npm", "run", "start:prod" ]
