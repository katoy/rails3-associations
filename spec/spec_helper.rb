# coding: utf-8

require 'capybara'
#require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/poltergeist'

require 'coveralls'
require 'simplecov'
require 'simplecov-rcov'

Coveralls.wear!

# simplecov, rcov, coderails の３通りの書式のレポートを生成する。
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::RcovFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }


# save scrennshot 
def my_screenshot(sno, name)
  screenshots_dir = "./screenshots"
  save_screenshot("#{screenshots_dir}/#{sprintf('%03d', sno)}_#{name}.png")
  sno += 1
end

RSpec.configure do |config|

  config.infer_spec_type_from_file_location!  # for rspec 2 -> rspec 3

  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

end
