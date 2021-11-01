#!/bin/bash

REGION=${1}
GATEWAY_ID=${2}
GATEWAY_NEG_ID=${3}

gcloud compute network-endpoint-groups create $GATEWAY_NEG_ID \
    --region=$REGION \
    --network-endpoint-type=serverless \
    --serverless-deployment-platform=apigateway.googleapis.com \
    --serverless-deployment-resource=$GATEWAY_ID