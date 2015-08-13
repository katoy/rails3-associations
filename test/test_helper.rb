# -*- coding: utf-8 -*-
require 'coveralls'
require 'simplecov'
require 'simplecov-rcov'
require 'fabrication'
require 'database_cleaner'


Coveralls.wear!

# simplecov, rcov, coderails の３通りの書式のレポートを生成する。
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::RcovFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start


ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_statement_invalid(&block)
    assert_raise(ActiveRecord::StatementInvalid, &block)
  end

  def assert_record_not_unique(&block)
    # assert_raise(ActiveRecord::RecordNotUnique, &block)
    assert_raise(ActiveRecord::StatementInvalid, &block)
  end

  def assert_invalid_foreign_key(&block)
    assert_raise(ActiveRecord::InvalidForeignKey, &block)
  end

end
