FROM ruby:2.3.1

  # Update package repositories
  RUN     apt-get update && apt-get install -y \
            build-essential \

  # Add build libaries (mainly used for native extension gems)
            libpq-dev \

  # Add 3rd party dependencies
            nodejs npm imagemagick

  # Create symlink for nodejs, otherwise phantomjs will fail to build
  RUN     ln -s /usr/bin/nodejs /usr/bin/node

  # These are all needed for jasmine tests :/
  # RUN     apk add --no-cache dbus firefox-esr fontconfig python ttf-freefont xvfb

  RUN     npm install -g phantomjs-prebuilt

  RUN     curl -sL https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/bin/cc-test-reporter
  RUN     chmod +x /usr/bin/cc-test-reporter

  RUN     rm -rf /var/cache/* /tmp/*

  EXPOSE 3000
