# SimpleCov
require "simplecov"
SimpleCov.start do
  add_filter "/spec/"
end
SimpleCov.coverage_dir "coverage"

# Sinatra App
ENV["APP_ENV"] = "test"
require_relative "../app"
def app
  Sinatra::Application
end

# Capybara
require "capybara/rspec"
Capybara.app = Sinatra::Application

# RSpec
RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods

  # before each test is run, delete all records in the Player table
  config.before do
    spec_before
  end
end

# This is to be overridden if needed in spec/spec_functions,
# providing a blank default implementation to prevent a runtime error.
def spec_before
end

require_if_exist("spec/spec_functions")
