#!/bin/bash

set -e

TARGET=${TARGET:-"hybris"}
PIPELINE_NAME=${PIPELINE_NAME:-"influxdata-firehose-nozzle-boshrelease"}

if ! [ -x "$(command -v fly)" ]; then
  echo 'fly is not installed.' >&2
fi

fly -t ${TARGET} set-pipeline -c pipeline.yml --pipeline=${PIPELINE_NAME}
if [ $? -ne 0 ]; then
  echo "Please login first: fly -t ${TARGET} login -k"
fi

