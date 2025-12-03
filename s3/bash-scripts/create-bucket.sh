#! /usr/bin/env bash
echo "Creating S3 bucket..."

if [ $# -eq 0 ]; then  
    echo "No bucket name provided"
    exit 1
fi

BUCKET_NAME=$1
REGION=$(aws configure get region)
if [ -z "$REGION" ]; then
  REGION="eu-west-1"
fi

aws s3api create-bucket \
--bucket $BUCKET_NAME \
--create-bucket-configuration LocationConstraint=$REGION
--query 'Location' \
--output text