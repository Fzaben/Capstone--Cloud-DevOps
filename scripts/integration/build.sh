#!/bin/sh
export TAG=$BUILD_NUMBER
TAG=$BUILD_NUMBER docker-compose -f ./scripts/integration/build.yml build 
TAG=latest docker-compose -f ./scripts/integration/build.yml build 

TAG=$BUILD_NUMBER docker-compose -f ./scripts/integration/build.yml push 
TAG=latest docker-compose -f ./scripts/integration/build.yml push 