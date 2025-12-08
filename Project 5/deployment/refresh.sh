#!/usr/bin/env bash
set -e

IMAGE="${DOCKERHUB_IMAGE:-jrw585jxc/project4:latest}"
CONTAINER_NAME="project5"

docker stop "$CONTAINER_NAME" || true
docker rm "$CONTAINER_NAME" || true

docker pull "$IMAGE"

docker run -d \
  --name "$CONTAINER_NAME" \
  --restart unless-stopped \
  -p 80:80 \
  "$IMAGE"
