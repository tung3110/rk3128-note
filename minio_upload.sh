#!/bin/bash

# Get dynamic credentials (could be passed as arguments or retrieved from a secure source)
MINIO_SERVER="$1"
ACCESS_KEY="$2"
SECRET_KEY="$3"
BUCKET_NAME="$4"
FILE_PATH="$5"

# Set credentials dynamically for mc
mc alias set myminio $MINIO_SERVER $ACCESS_KEY $SECRET_KEY

# Upload file
mc cp $FILE_PATH myminio/$BUCKET_NAME/

echo $FILE_PATH
echo "File uploaded successfully!"

# sample
# ./minio_upload.sh http://log-devi1ce.devbt.com:9110 hZf0n1I2pKdfsdf3Eob8hseLW sdff dev-log amz.c
