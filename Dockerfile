FROM ubuntu:18.04

LABEL maintainer="team@appwrite.io"

EXPOSE 5678

ENV RESQUE_WEB_HOST 127.0.0.1
ENV RESQUE_WEB_PORT 6379

COPY ./config.ru /config.ru
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod 775 /entrypoint.sh

RUN apt-get update && \
    apt-get install --no-install-recommends -y ruby \
        ruby-dev \
        zlib1g-dev \
        build-essential && \
    apt-get update && \
    gem install redis \
        resque-web \
        resque-scheduler-web && \
    apt-get autoremove -y ruby-dev \
        zlib1g-dev \
        build-essential && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
