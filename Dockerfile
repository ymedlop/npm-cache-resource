FROM mhart/alpine-node:8

MAINTAINER Yeray Medina López <ymedlop@gmail.com>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="npm-cache-resource" \
      org.label-schema.description="a Concourse resource for caching dependencies downloaded by NPM - built on mhart/alpine-node." \
      org.label-schema.url="https://ymedlop.github.io/npm-cache-resource" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/ymedlop/npm-cache-resource" \
      org.label-schema.vendor="ymedlop" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0" \
      org.label-schema.license="MIT"

RUN apk add --update \
    libressl \
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
     # Fix problem with some dependencies: https://github.com/ymedlop/npm-cache-resource/issues/39
    libtool \
    automake \
    autoconf \
    nasm \
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
