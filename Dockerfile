FROM ubuntu:18.04

LABEL maintainer="team@appwrite.io"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y ruby ruby-dev zlib1g-dev build-essential && \
    apt-get update && \
    gem install redis && \
    gem install resque-web && \
    gem install resque-scheduler-web && \
    apt-get autoremove -y ruby-dev zlib1g-dev build-essential && \
    apt-get clean -y

ADD ./config.ru /config.ru
ADD ./entrypoint.sh /entrypoint.sh

RUN chmod 775 /entrypoint.sh

ENV RESQUE_WEB_HOST 127.0.0.1
ENV RESQUE_WEB_PORT 6379

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 5678