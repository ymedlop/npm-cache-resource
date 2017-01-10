FROM mhart/alpine-node:0.12

MAINTAINER Yeray Medina López <ymedlop@gmail.com>

RUN apk add --update \
    openssl \
    sed \
    ca-certificates \
    bash \
    openssh \
    make \
    git \
    jq \
    libstdc++ \
    libpng-dev \
    nasm \
    build-base \
    python \
    python-dev \
  && rm -rf /var/cache/apk/*

# according to Brian Clements, can't `git pull` unless we set these
RUN git config --global user.email "git@localhost" && \
    git config --global user.name "git"

# install git resource (and disable LFS, which we happen not to need)
RUN mkdir -p /opt/resource/git && \
    wget https://github.com/concourse/git-resource/archive/master.zip -O /opt/resource/git/git-resource.zip && \
    unzip /opt/resource/git/git-resource.zip -d /opt/resource/git && \
    mv /opt/resource/git/git-resource-master/assets/* /opt/resource/git && \
    rm -r /opt/resource/git/git-resource.zip /opt/resource/git/git-resource-master && \
    sed -i '/git lfs/s/^/echo /' /opt/resource/git/in

# install npm cache resource
ADD assets/ /opt/resource/
RUN mkdir /var/cache/git

RUN chmod +x /opt/resource/check /opt/resource/in /opt/resource/out

# install npm-clip-login to help us with the npm login
RUN npm install -g npm-cli-login
