source :rubygems

gem 'rails', '~> 3'
gem 'mongoid', '~> 2'
gem 'resque', '~> 1'
gem 'ohm', '~> 0.1'
gem 'tire', '~> 0.3'
gem 'dalli', '~> 1'

gem 'sorcery', '~> 0.7'
gem 'draper', '~> 0.9'
gem 'simple_form', '~> 2'
gem 'stripe', '~> 1'

gem 'redcarpet', '~> 2'
gem 'slim-rails', '~> 1'
gem 'jquery-rails', '~> 2'

gem 'thin', '~> 1'

gem 'bson_ext', '~> 1'
gem 'bcrypt-ruby', '~> 3', require: 'bcrypt'

group :production do
  gem 'newrelic_rpm', '~> 3'
end

group :development do
  gem 'heroku', '~> 2'
  gem 'guard', '~> 1'
  gem 'guard-rspec', '~> 0.6'
  gem 'guard-spork', '~> 0.5'
  gem 'rails_best_practices', '~> 1'
  gem 'awesome_print', '~> 1'
  gem 'highline', '~> 1'
end

group :test do
  gem 'spinach', '~> 0.3'
  gem 'capybara', '~> 1'
  gem 'shoulda-matchers', '~> 1'
  gem 'mongoid-rspec', '~> 1'
  gem 'spork', '~> 0.9'
  gem 'database_cleaner', '~> 0.7'
end

group :test, :development do
  gem 'foreman', '0.40'
  gem 'spinach-rails', '~> 0.0.6'
  gem 'rspec-rails', '~> 2'
  gem 'faker', '~> 1'
  gem 'factory_girl_rails', '~> 1'
end

# Gems only for assets, not required in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3'
  gem 'coffee-rails', '~> 3'
  gem 'uglifier', '~> 1'
end
