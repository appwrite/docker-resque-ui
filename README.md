# Docker Resque Web UI

[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)
[![Docker Pulls](https://img.shields.io/docker/pulls/appwrite/resque-web?color=f02e65&style=flat-square)](https://hub.docker.com/r/appwrite/resque-web)
[![Build Status](https://img.shields.io/travis/com/appwrite/docker-resque-ui?style=flat-square)](https://travis-ci.com/appwrite/docker-requestcatcher)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite)
[![Follow Appwrite on StackShare](https://img.shields.io/badge/follow%20on-stackshare-blue?style=flat-square)](https://stackshare.io/appwrite)

User interface container for the Redis [Resque Web UI](https://github.com/resque/resque-web) project. This container include default configuration to allow HTTP basic auth. Not recommended for production environments not running behind a network firewall.

## Usage

docker-compose.yml
```yml
resque:
  image: appwrite/resque-web:1.1.0
  links:
    - redis:redisserver
  ports:
    - "5678:5678"
  environment:
    - RESQUE_WEB_HOST=redisserver # (OPTIONAL - Use only if different than the default 127.0.0.1)
    - RESQUE_WEB_PORT=6379  # (OPTIONAL - Use only if different the default 6379)
    - RESQUE_WEB_HTTP_BASIC_AUTH_USER=user # (OPTIONAL - if not set no password used)
    - RESQUE_WEB_HTTP_BASIC_AUTH_PASSWORD=password  # (OPTIONAL - if not set no password used)
```

or with docker run
```bash
docker run --rm -p 5678:5678 appwrite/resque-web:v1.0.0  
```

## Build
```bash
docker build -t appwrite/resque-web:1.0.0 .
```

## Push
```bash
docker push appwrite/resque-web:1.0.0
```

## Find Us

* [GitHub](https://github.com/appwrite)
* [Discord](https://appwrite.io/discord)
* [Twitter](https://twitter.com/appwrite)

## Copyright and license

The MIT License (MIT) [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
