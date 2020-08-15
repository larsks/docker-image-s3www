#!/bin/bash

: ${S3_PORT:=8080}

for req in S3_ENDPOINT S3_ACCESSKEY S3_SECRETKEY S3_BUCKET; do
	if ! [[ "${!req}" ]]; then
		echo "ERROR: missing required variable $req" >&2
		exit 1
	fi
done

exec /bin/s3www \
	-endpoint ${S3_ENDPOINT} \
	-accessKey ${S3_ACCESSKEY} \
	-secretKey ${S3_SECRETKEY} \
	-bucket ${S3_BUCKET} \
	-address 0.0.0.0:${S3_PORT} \
	"$@"
