FROM ruby:4.0-alpine@sha256:8ad6909db16ad53b5dc90bb8cc157e5fdd89ba1172798316b95cfd2a61f14b1e

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
