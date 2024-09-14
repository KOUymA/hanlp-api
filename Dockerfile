FROM node:18.20.4
MAINTAINER Hain Wang <hailiang.hl.wang@gmail.com>

RUN apt-get update
RUN apt-cache search openjdk
RUN apt-get install openjdk-17-jdk -y

RUN npm install -g pnpm
RUN /bin/bash -c "mkdir -p /hanlp-api"
COPY . /hanlp-api
WORKDIR /hanlp-api
RUN pnpm install

ENTRYPOINT ["node"]
CMD ["app.js"]

EXPOSE 3001