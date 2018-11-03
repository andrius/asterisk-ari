# vim:set ft=dockerfile:
FROM andrius/alpine-ruby:latest

LABEL maintainer="Andrius Kairiukstis <k@andrius.mobi>"

RUN apk add --update \
      bash \
      git \
      libstdc++ \
      libxml2 \
      libxslt \
      libffi \
      pcre \
      tzdata \
      vim \
      zlib \
      \
      build-base \
      libxml2-dev \
      libxslt-dev \
      libffi-dev \
      pcre-dev \
      ruby-dev \
      ruby-irb \
      ruby-rdoc \
      ruby-io-console \
\
&& cp -R /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime \
&& echo 'Europe/Amsterdam' > /etc/timezone \
&& rm -rf /var/cache/apk/*

SHELL ["bash", "-c"]

ENV WORKDIR /app
WORKDIR ${WORKDIR}/

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
