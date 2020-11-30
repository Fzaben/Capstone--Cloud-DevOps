#!/bin/sh
export TAG=$BUILD_NUMBER
TAG=$BUILD_NUMBER docker-compose -f pipeline/build.yml build $APP_NAME
TAG=latest docker-compose -f pipeline/build.yml build $APP_NAME

TAG=$BUILD_NUMBER docker-compose -f pipeline/build.yml push $APP_NAME
TAG=latest docker-compose -f pipeline/build.yml push $APP_NAME