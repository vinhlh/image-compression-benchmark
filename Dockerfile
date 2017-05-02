FROM alpine:latest

MAINTAINER Vinh Le <hung.vjnh@gmail.com>

ARG VERSION=v1.0.1

RUN apk update
RUN apk add --update --no-cache libpng-dev

RUN apk add --no-cache --virtual .bootstrap-deps wget ca-certificates

RUN wget --no-check-certificate https://github.com/google/guetzli/releases/download/${VERSION}/guetzli_linux_x86-64

RUN apk del .bootstrap-deps

RUN chmod +x guetzli_linux_x86-64
RUN ./guetzli_linux_x86-64
RUN mv guetzli_linux_x86-64 /usr/local/bin/guetzli
RUN ls -lah /usr/local/bin/guetzli

RUN guetzli -h

ENTRYPOINT ["/usr/local/bin/guetzli"]
