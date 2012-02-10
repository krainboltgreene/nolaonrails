RSpec.configure do |config|
  # Define the cleaning strategy to clean the database
  DatabaseCleaner[:mongoid].strategy = :truncation

  # Star the cleaner before each run
  config.before(:each) { DatabaseCleaner.start }

  # Clean the database after each run
  config.after(:each) { DatabaseCleaner.clean }
end
