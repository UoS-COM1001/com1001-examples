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
    Player.dataset.delete
  end
end

# Helper function for testing
def add_test_player_to_db(first_name = "George", surname = "Test", gender = "M", club = "Mantester Utd",
                          country = "Northern RSpec", position = "Midfield", date_of_birth = "1946-05-22")
  player = Player.new
  player.first_name = first_name
  player.surname = surname
  player.gender = gender
  player.club = club
  player.country = country
  player.position = position
  player.date_of_birth = date_of_birth
  player.save_changes
  player
end
