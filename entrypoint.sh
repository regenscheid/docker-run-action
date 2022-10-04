#!/usr/bin/env bash

if [ ! -z $INPUT_USERNAME ];
then echo $INPUT_PASSWORD | docker login $INPUT_REGISTRY -u $INPUT_USERNAME --password-stdin
echo 'input registry'
echo $INPUT_REGISTRY
fi

if [ ! -z $INPUT_DOCKER_NETWORK ];
then INPUT_OPTIONS="$INPUT_OPTIONS --network $INPUT_DOCKER_NETWORK"
echo 'input options'
echo $INPUT_OPTIONS
echo 'input dockern network'
echo $INPUT_DOCKER_NETWORK
fi

exec docker run $INPUT_OPTIONS --entrypoint=$INPUT_SHELL $INPUT_IMAGE -c "${INPUT_RUN//$'\n'/;}"
