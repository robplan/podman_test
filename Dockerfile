FROM arm64v8/ruby:alpine

RUN gem update --system 3.5.6

RUN apk update && apk add --update --virtual \
  runtime-deps \
  build-base \
  postgresql-dev \
  gcompat \
  libxml2-dev \
  libxslt-dev \
  libffi-dev \
  tzdata \
  && rm -rf /var/cache/apk/* 

ADD . /app
RUN cd /app && bundle install
