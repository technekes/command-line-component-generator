# base layer
FROM ruby:2.6-alpine AS base

WORKDIR /usr/src/app

# REMOVE THIS INSTRUCTION 👇 BEFORE MERGE!!
RUN \
  apk add --update --no-cache \
    bash \
    build-base \
    postgresql-client \
    postgresql-dev
# REMOVE THIS INSTRUCTION 👆 BEFORE MERGE!!

COPY gems.rb *.gemspec /usr/src/app/

RUN \
  bundle install -j 4

COPY . /usr/src/app
