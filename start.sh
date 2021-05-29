#!/bin/bash

bin/yarn
bundle exec rake db:setup db:seed
rails s -b 0.0.0.0 --pid /tmp/rails.pid

