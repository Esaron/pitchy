FROM ruby:2.6.5

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN gem install bundler:2.2.18
RUN bundle install

CMD rails s -b 0.0.0.0

