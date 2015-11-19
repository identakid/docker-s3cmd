FROM alpine:edge
MAINTAINER identakid.net <ccssdev@identakid.net>
ENV VERSION 1.6.0

RUN apk add --update python
RUN apk add --update py-pip
RUN pip install python-dateutil
RUN apk add --update bash ca-certificates

RUN wget -P /tmp "https://github.com/s3tools/s3cmd/releases/download/v$VERSION/s3cmd-$VERSION.tar.gz" \
	&& tar -xzf "/tmp/s3cmd-$VERSION.tar.gz" -C /tmp \
	&& mv "/tmp/s3cmd-$VERSION" /var/s3cmd \
	&& rm "/tmp/s3cmd-$VERSION.tar.gz" \
	&& ln -s /var/s3cmd/s3cmd /usr/local/bin/s3cmd

ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
RUN mkdir /opt
ADD files/.s3cfg /opt/.s3cfg
WORKDIR /opt
