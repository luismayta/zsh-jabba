FROM python:3.7.3

MAINTAINER Luis Mayta <@slovacus>

ARG stage

LABEL NAME zsh-jabba-app-$stage

ENV PACKAGES bash \
        git \
  gcc \
  libc-dev \
  make \
  musl-dev \
  openssl \
  gcc \
  libgdal20 \
  libev-dev


COPY Pipfile Pipfile.lock /usr/src/

# set working directory to /usr/src/
WORKDIR /usr/src/

RUN  groupadd -g 500 -r python \
  && groupadd developer \
  && useradd -m -g developer -G python developer \
  && chown -R developer:python /usr/local/bin \
  && mkdir -p /usr/src \
  && chown -R developer /usr/src \
  && apt-get update -y \
  && apt-get install -y $PACKAGES \
  && pip3 install pipenv \
  && pipenv install --ignore-pipfile --system
