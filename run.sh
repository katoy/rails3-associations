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
rake db:fixtures:load

rake test
rake spec
# rake test:single TEST=test/units/lock_version_test.rb

rake erd filetype=png

# RAILS_ENV=production rake db:drop
# RAILS_ENV=production rake db:migrate
# RAILS_ENV=production rake db:fixtures:load
# rails s -e production
