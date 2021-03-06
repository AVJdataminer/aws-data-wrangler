#!/usr/bin/env bash
set -e

AWS_ACCESS_KEY_ID=$(aws --profile default configure get aws_access_key_id)
AWS_SECRET_ACCESS_KEY=$(aws --profile default configure get aws_secret_access_key)
AWS_DEFAULT_REGION=us-east-1

docker run \
    -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
    -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
    -e AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
    --workdir /aws-data-wrangler/testing \
    -v $(dirname $PWD):/aws-data-wrangler/ \
    -it \
    -p 8888:8888 \
    --entrypoint /bin/bash \
    awswrangler-testing