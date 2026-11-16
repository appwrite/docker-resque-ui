FROM ruby:2.7-alpine@sha256:371668748735a808d1fd1c506878e09f40cb542ffc758cfa7eb124f90827e8d9

LABEL maintainer="team@appwrite.io"

RUN apk add --no-cache bash ruby-dev zlib-dev build-base && \
  rm -f /var/cache/apk/* && \
  gem install --no-document redis resque-web resque-scheduler-web && \
  apk del ruby-dev zlib-dev build-base

ADD ./config.ru /config.ru
ADD ./entrypoint.sh /entrypoint.sh

RUN chmod 775 /entrypoint.sh

ENV RESQUE_WEB_HOST 127.0.0.1
ENV RESQUE_WEB_PORT 6379

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5678
