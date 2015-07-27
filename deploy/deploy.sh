#! /bin/bash
set -e

DOCKER_REGISTRY_USER_NAME="wldandan"
APP_NAME="products-service"
APP_VERSION="latest"

FULL_TAG=$DOCKER_REGISTRY_USER_NAME/$APP_NAME:$APP_VERSION

echo "Pulling Docker image from Registry"
docker pull $FULL_TAG

echo "Launching Dokcer Container"
docker run -d -p 80:8080 --name product-service $FULL_TAG
