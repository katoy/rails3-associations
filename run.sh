#!/bin/bash

# PATH=/opt/local/bin:/sbin:/usr/sbin:/bin:/usr/bin:/Users/youichikato/.rvm/bin
# echo $PATH
# source /Users/youichikato/.rvm/scripts/rvm
# rvm use ruby-1.9.3@global

# gem bundle clean --force
# gem install bundler
# gem intall spring

bundle install
bundle viz

rake db:drop
rake db:migrate
rake test

rake erd filetype=png

