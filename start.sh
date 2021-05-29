#!/bin/bash

bundle exec rake db:setup
rails s -b 0.0.0.0 --pid /var/tmp/rails.pid

