FROM alpine:latest AS builder

ARG S3WWW_VERSION=0.4.0

RUN wget https://github.com/harshavardhana/s3www/releases/download/v${S3WWW_VERSION}/s3www_${S3WWW_VERSION}_linux_amd64.tar.gz
RUN tar xf s3www_${S3WWW_VERSION}_linux_amd64.tar.gz s3www

FROM alpine:latest

RUN apk add --update bash
COPY --from=builder /s3www /bin/s3www
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash", "/entrypoint.sh"]
