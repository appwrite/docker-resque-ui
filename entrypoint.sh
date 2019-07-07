#!/usr/bin/env bash

resque-web -FL -r "redis://${RESQUE_WEB_HOST}:${RESQUE_WEB_PORT}" /config.ru