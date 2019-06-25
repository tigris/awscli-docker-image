FROM alpine:latest@sha256:ca1c944a4f8486a153024d9965aafbe24f5723c1d5c02f4964c045a16d19dc54

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
