# SimpleCov
require "simplecov"
SimpleCov.start do
  add_filter "/app.rb"
  add_filter "/helpers/helpers.rb"
  add_filter "/db/"
  add_filter "/spec/"
end
SimpleCov.coverage_dir "spec/_coverage"

# Sinatra App
ENV["APP_ENV"] = "testing"
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
end
