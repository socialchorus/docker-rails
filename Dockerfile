FROM ruby:2.3.1-alpine

  # Update package repositories
  RUN     apk update

  # Add build libaries (mainly used for native extension gems)
  RUN     apk add --no-cache build-base
  RUN     apk add --no-cache postgresql-dev

  # Add 3rd party dependencies
  RUN     apk add --no-cache nodejs
  RUN     apk add --no-cache git
  RUN     apk add --no-cache bash
  RUN     apk add --no-cache imagemagick
  RUN     apk add --no-cache curl
  RUN     apk add --no-cache tar gzip
  # These are all needed for jasmine tests :/
  # RUN     apk add --no-cache dbus firefox-esr fontconfig python ttf-freefont xvfb

  RUN     mkdir -p /usr/share && \
            cd /usr/share \
            && curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj \
            && ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs \
            && phantomjs --version

  RUN     curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/bin/cc-test-reporter
  RUN     chmod +x /usr/bin/cc-test-reporter

  RUN     rm -rf /var/cache/* /tmp/*

  EXPOSE 3000
