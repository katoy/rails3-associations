#!/bin/bash

PATH=/opt/local/bin:/sbin:/usr/sbin:/bin:/usr/bin:/Users/youichikato/.rvm/bin
# echo $PATH
source /Users/youichikato/.rvm/scripts/rvm
rvm use ruby-1.9.3@global

# gem install bundler
bundle install
rake db:drop
rake db:migrate
rake test
rake erd filetype=png
