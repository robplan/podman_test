FROM ruby:alpine

RUN gem update --system 3.5.6

RUN apk update && apk add --update --virtual \
  runtime-deps \
  build-base \
  #postgresql-client \
  postgresql-dev \
  #libxml2-dev \
  #libxslt-dev \
  #libffi-dev \
  #readline \
  #readline-dev \
  #shared-mime-info \
  #file \
  #imagemagick \
  #tzdata \
  #openssh \
  && rm -rf /var/cache/apk/* 


COPY ./Gemfile* /root

RUN ls -hal /root

RUN cd /root && bundle install
