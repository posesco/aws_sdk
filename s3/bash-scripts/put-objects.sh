#! /usr/bin/env bash
echo "Putting objects into S3 bucket..."

if [ $# -eq 0 ]; then
    echo "No bucket name provided"
    exit 1
fi
BUCKET_NAME=$1

output_dir="/tmp/ramdom_files"

mkdir -p "$output_dir"

echo "Creating 500 random files in $output_dir..."

touch "$output_dir/ramdom_"{1..500}".txt"

for i in {2..500}; do
    dd if=/dev/urandom of="$output_dir/ramdom_$i.txt" bs=1024 count=$((RANDOM % 1024 + 1)) 2>/dev/null
done


echo "Uploading files to S3 bucket $BUCKET_NAME..."
aws s3api put-object \
--bucket "$BUCKET_NAME" \
--body "$output_dir/ramdom_1.txt" \
--key "ramdom_files/ramdom_1.txt"