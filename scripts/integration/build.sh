#!/bin/sh
export TAG=$BUILD_NUMBER
TAG=$BUILD_NUMBER docker-compose -f scripts/integration/build.yml build $APP_NAME
TAG=latest docker-compose -f scripts/integration/build.yml build $APP_NAME

TAG=$BUILD_NUMBER docker-compose -f scripts/integration/build.yml push $APP_NAME
TAG=latest docker-compose -f scripts/integration/build.yml push $APP_NAME