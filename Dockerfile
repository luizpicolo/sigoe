FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends vim nodejs postgresql-client

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install yarn -y

RUN mkdir -p /siai-ifms-na

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
RUN gem install bundler-audit

WORKDIR /siai-ifms-na
ADD . /siai-ifms-na
