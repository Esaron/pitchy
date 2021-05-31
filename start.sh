#!/bin/bash

# This would be fine for something like CI where we're only going to spin up a container once, but
# for local development, you'd want to orchestrate the DB differently. This is only here for an easy
# first time startup; I know it's not ideal.
bundle exec rake db:setup db:seed
rails s -b 0.0.0.0 --pid /tmp/rails.pid

