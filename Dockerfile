FROM ruby:2.6.3-stretch

# This prevents us from get errors during apt-get installs as it notifies the environment that it is a non-interactive one.
ENV DEBIAN_FRONTEND noninteractive

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
RUN bundle config build.nokogiri --use-system-libraries

RUN apt-get update -y \ 
&& apt-get install -y curl apt-transport-https imagemagick libmagickwand-dev nodejs ghostscript --no-install-recommends \ 
&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \ 
&& curl -sL https://deb.nodesource.com/setup_10.x | bash - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \ 
&& apt-get update -y \ 
&& apt-get install -y yarn nodejs \ 
&& rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install 
&& bundle exec rails webpacker:install \\
&& bundle exec yarn install --check-files


COPY . /usr/src/app
RUN bundle exec yarn install --check-files \
&& bundle exec rails webpacker:install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

