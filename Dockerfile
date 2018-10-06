# vim:set ft=dockerfile:
FROM andrius/alpine-ruby:latest

LABEL maintainer="Andrius Kairiukstis <k@andrius.mobi>"

RUN apk add --update \
      bash \
      git \
      tzdata \
      libstdc++ \
      libxml2 \
      libxslt \
      libffi \
      pcre \
      zlib \
      build-base \
      libxml2-dev \
      libxslt-dev \
      libffi-dev \
      pcre-dev \
      ruby-dev \
      ruby-irb \
      ruby-rdoc \
      ruby-io-console \
&& cp -R /usr/share/zoneinfo/Europe/Madrid /etc/localtime \
&& echo 'Europe/Amsterdam' > /etc/timezone \
&& rm -rf /var/cache/apk/*

WORKDIR /app

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["bundle", "exec", "ruby", "./websocket.rb"]
