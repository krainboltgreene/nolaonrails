require 'spork'

Spork.prefork do
  ENV['RAILS_ENV'] ||= 'test'
  require_relative '../config/environment'
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'capybara/rails'

  # Require all of the test support libraries
  require_relative 'support/rspec'
  require_relative 'support/database_cleaner'
end

Spork.each_run {}
