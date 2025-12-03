#! /usr/bin/env bash
echo "Listing objects into S3 bucket..."

if [ $# -eq 0 ]; then
    echo "No bucket name provided"
    exit 1
fi
BUCKET_NAME=$1

aws s3 ls \
"s3://$BUCKET_NAME/ramdom_files/" --recursive --summarize