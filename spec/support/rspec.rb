RSpec.configure do |config|
  # Only run tests that have this filter, if it exists
  config.filter_run :debug => true

  # Run all the tests when all the tests are filtered
  config.run_all_when_everything_filtered = true

  # Treat all symbols as keys with true values
  config.treat_symbols_as_metadata_keys_with_true_values = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Bring in the Mailer Macros
  # config.include MailerMacros

  # Bring in the Mongoid Matchers
  config.include Mongoid::Matchers

  # Reset all emails before each run
  # config.before(:each) { reset_email }
end
