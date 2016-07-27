TAG=${DOCKER_IMAGE_TAG:-"devmgt"}
docker build -t="gtoff/salt_master:${TAG}" .
