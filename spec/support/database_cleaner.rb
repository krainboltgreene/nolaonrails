RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  # Star the cleaner before each run
  config.before(:each) { DatabaseCleaner.start }

  # Clean the database after each run
  config.after(:each) { DatabaseCleaner.clean }
end
