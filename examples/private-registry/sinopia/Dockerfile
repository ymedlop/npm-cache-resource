FROM node:0.12

MAINTAINER Yeray Medina López <ymedlop@gmail.com>

WORKDIR /opt/sinopia

RUN npm install js-yaml sinopia && npm cache clean

EXPOSE 4873
VOLUME ["/opt/sinopia/storage","/opt/sinopia/config"]

CMD ["/opt/sinopia/node_modules/sinopia/bin/sinopia","--config","/opt/sinopia/config/config.yaml"]