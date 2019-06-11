FROM alpine:latest@sha256:769fddc7cc2f0a1c35abb2f91432e8beecf83916c421420e6a6da9f8975464b6

MAINTAINER Danial Pearce <danial.pearce@gmail.com>

RUN addgroup somebody \
 && adduser -D somebody -G somebody

ARG AWSCLI_VERSION

RUN apk --update add python py-pip less groff ca-certificates \
 && pip install --upgrade pip awscli==$AWSCLI_VERSION \
 && rm -rf /tmp/* /root/.cache /var/cache/apk/* \
 && find / -regex '.*\.py[co]' -delete

USER somebody

ENTRYPOINT ["/usr/bin/aws"]
