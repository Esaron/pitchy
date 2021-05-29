FROM ruby:2.6.5

RUN apt-get update
RUN apt-get install -y npm ghostscript graphicsmagick poppler-utils poppler-data libreoffice
RUN npm install -g yarn

RUN mkdir -p /var/app
COPY Gemfile Gemfile.lock /var/app/
WORKDIR /var/app

RUN gem install bundler:2.2.18
RUN bundle install
RUN yarn install

COPY . /var/app

CMD ./start.sh

