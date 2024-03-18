FROM ruby:3.0.6
 
RUN apt-get update -qq && apt-get install -y --no-install-recommends curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential nodejs libpq-dev yarn nano google-chrome-stable

RUN mkdir /app

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install
ADD . /app

EXPOSE 3000