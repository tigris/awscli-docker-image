FROM alpine:latest@sha256:ab00606a42621fb68f2ed6ad3c88be54397f981a7b70a79db3d1172b11c4367d

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
