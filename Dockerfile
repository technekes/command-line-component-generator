# base layer
FROM ruby:2.6-alpine AS base

WORKDIR /usr/src/app

RUN \
  apk add --no-cache \
    git \
    openssh

COPY gems.rb *.gemspec /usr/src/app/

RUN \
  bundle install -j 4

COPY . /usr/src/app
