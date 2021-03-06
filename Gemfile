# -*- coding: utf-8 -*-
source 'https://rubygems.org'

gem 'rails', '~>3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'


  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'less-rails'
gem 'twitter-bootstrap-rails'

gem 'simple_form'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'    # for ruby 1.9

gem 'foreigner'
gem 'carrierwave'
gem 'mini_magick'

group :development, :test do
  # gem 'rails-erd'
  # See http://qiita.com/takecian/items/ab5e292a369f77c0e10c
  gem 'rails-erd', github: 'paulwittmann/rails-erd', branch: 'mavericks'
  gem 'redcarpet', require: false
  gem 'fabrication'

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry'
  # gem 'pry-debugger'  # for ruby 1.9
  gem 'pry-byebug'      # for ruby 2
  gem 'pry-doc'
  gem 'pry-rails'
end

group :test do
  gem 'test-unit', '~> 3.0'
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'coveralls', require: false

  # テスト自動化用のライブラリ
  gem 'poltergeist'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec', '= 2.99.0'
  gem 'rspec-rails', '>= 2.0.0', :group => :development
end

gem 'i18n-missing_translations'
gem 'rack-mini-profiler'

gem 'yard', require: false

gem 'log4r'
gem 'table_print'


# gem 'passenger'
