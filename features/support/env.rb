# Generated by cucumber-sinatra. (2013-11-04 14:37:31 +0000)

ENV['RACK_ENV'] = 'test'

require './server'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/bookmark_manager.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

require 'database_cleaner'
require 'database_cleaner/cucumber'


Capybara.app = BookmarkManager
DatabaseCleaner.strategy = :truncation

class BookmarkManagerWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  BookmarkManagerWorld.new
end

Before do
  DatabaseCleaner.start
end

After do |scenario|
  DatabaseCleaner.clean
end