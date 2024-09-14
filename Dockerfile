FROM node:20.17.0
MAINTAINER Hain Wang <hailiang.hl.wang@gmail.com>

RUN apt-get update
RUN apt-cache search openjdk
RUN apt-get install openjdk-17-jdk -y

RUN npm install -g cnpm --registry=https://registry.npmmirror.com
RUN /bin/bash -c "mkdir -p /hanlp-api"
COPY . /hanlp-api
WORKDIR /hanlp-api
RUN cnpm install

ENTRYPOINT ["node"]
CMD ["app.js"]

EXPOSE 3001