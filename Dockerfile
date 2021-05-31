FROM ruby:2.6.5

RUN apt-get update
RUN apt-get install -y npm ghostscript graphicsmagick poppler-utils poppler-data libreoffice
RUN npm install -g yarn

RUN mkdir -p /var/app
COPY Gemfile Gemfile.lock yarn.lock package.json /var/app/
COPY bin /var/app/bin
WORKDIR /var/app

RUN gem install bundler:2.2.18
RUN bundle install
RUN bin/yarn

COPY . /var/app

CMD ./start.sh

