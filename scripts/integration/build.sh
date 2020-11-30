#!/bin/sh
export TAG=$BUILD_NUMBER
TAG=$BUILD_NUMBER docker-compose -f pipeline/build.yml build $APP_NAME
TAG=latest docker-compose -f pipeline/build.yml build $APP_NAME

docker login --username $DOCKER_HUB_USERNAME --password $DOCKER_HUB_PASSWORD
TAG=$BUILD_NUMBER docker-compose -f pipeline/build.yml push $APP_NAME
TAG=latest docker-compose -f pipeline/build.yml push $APP_NAME