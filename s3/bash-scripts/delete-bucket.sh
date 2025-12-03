#! /usr/bin/env bash
echo "Deleting S3 bucket..."

if [ $# -eq 0 ]; then  
    echo "No bucket name provided"
    exit 1
fi

BUCKET_NAME=$1
aws s3api delete-bucket --bucket $BUCKET_NAME 