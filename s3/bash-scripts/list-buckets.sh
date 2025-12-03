#! /usr/bin/env bash
echo "Listing S3 buckets..."

aws s3api list-buckets \
--output table
