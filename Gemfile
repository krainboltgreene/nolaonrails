source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.7'
gem 'unicorn', '4.3.1'
gem 'dalli', '2.1.0'

gem 'draper', '0.15.0'
gem 'sorcery', '0.7.13'
gem 'omniauth', '1.1.0'
gem 'carrierwave', '0.6.2'
gem 'simple_form', '2.0.2'
gem 'slim-rails', '1.0.3'
gem 'redcarpet', '2.1.1'
gem 'jquery-rails', '2.0.2'
gem 'stripe', '1.7.0'
gem 'configatron', '2.9.1'

gem 'omniauth-github', '1.0.1'
gem 'omniauth-facebook', '1.2.0'
gem 'rmagick', '2.13.1'

# gem 'omniauth-twitter', '0.0.12'
# gem 'omniauth-linkedin', '0.0.6'
# gem 'tire', '0.4.2'

group :production, :staging do
  gem 'pg', '0.14.0'
  gem 'asset_sync', '0.4.2'
  gem 'newrelic_rpm', '3.4.1'
  gem 'dalli', '2.1.0'
  gem 'sendgrid-rails', '2.0.2'
end

group :development, :test do
  gem 'sqlite3', '1.3.6'
  gem 'factory_girl_rails', '3.5.0'
  gem 'forgery', '0.5.0'
  gem 'dotenv', '0.1.0'
  gem 'capybara', '1.1.2'
  gem 'database_cleaner', '0.8.0'
  gem 'rspec-rails', '2.11.0'
  gem 'spork', '0.9.2'
end

group :development do
  gem 'foreman', '0.53.0'
  gem 'pry-rails', '0.1.6'
  gem 'email_spy', '1.6.0'
  gem 'quiet_assets', '1.0.1'
  gem 'vendorer', '0.1.11'
  # gem 'debugger'
end

group :assets do
  gem 'sass-rails', '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.6'
  # gem 'yui-compressor', '0.9.6'
end
