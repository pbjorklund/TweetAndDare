source 'https://rubygems.org'

gem 'rails', '3.2.6'

gem 'pg'
gem 'capistrano'
gem 'capistrano_colors', :require => nil
gem 'rvm-capistrano'

gem 'omniauth-twitter', :git => 'https://github.com/arunagw/omniauth-twitter.git'

gem 'twitter'

gem 'haml-rails', '~> 0.3.4'
gem 'simple_form', '~> 2.0.2'
gem 'client_side_validations', '~> 3.2'
gem 'client_side_validations-simple_form'
gem 'google-analytics-rails'
gem 'acts_as_votable'

# Gems used only for assets and not required
# in production environments by default.

group :production, :assets do
  gem 'therubyracer'
  gem 'execjs'
end

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'sass-rails',   '~> 3.2.3'
gem 'bootstrap-sass', '~> 2.1.0.0' # Needs to be outside Asset Scope


group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0.0'
  gem 'fakeweb'
  gem "launchy"
end

group :development, :test do
  gem 'rspec-rails', '~> 2.11.0'
  gem 'guard-rspec', '~> 1.2.1'
  gem 'guard-cucumber'
  gem 'spork', '~> 1.0rc'

  gem "guard-spork", '~> 1.1.0'
  gem "guard-bundler"
  gem 'capybara'
  gem "capybara-webkit"
  gem 'cucumber-rails', require: false

  gem 'rb-fsevent', '~> 0.9.1'
  gem 'pry'
  gem 'pry-nav'
  # gem 'growl' # also install growlnotify from the Extras/growlnotify/growlnotify.pkg in Growl disk image
end

group :development do
  gem 'foreman'
end

gem 'unicorn'

