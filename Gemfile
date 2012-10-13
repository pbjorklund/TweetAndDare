source 'https://rubygems.org'

gem 'rails', '3.2.5'
gem 'pg'
gem 'capistrano'
gem 'rvm-capistrano'

gem 'unicorn'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'less-rails'
  gem 'less-rails-bootstrap'
  gem 'less-rails-bootswatch'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem "factory_girl_rails"
  gem 'capybara'
  gem "capybara-webkit"
  gem 'fakeweb'
  gem "launchy"
  gem 'database_cleaner', :group => :test
end

group :development, :test do
  gem "guard"
  gem "guard-rspec"
  gem "guard-cucumber"
  gem "guard-bundler"
  gem "guard-spork"
  gem 'spork'
  gem 'rb-fsevent'
  gem 'pry'
  gem 'growl' # also install growlnotify from the Extras/growlnotify/growlnotify.pkg in Growl disk image
  gem 'unicorn'
end
