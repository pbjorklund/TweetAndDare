source 'https://rubygems.org'

gem 'rails', '3.2.5'
gem 'pg'
gem 'capistrano'
gem 'rvm-capistrano'

gem 'unicorn'

gem 'haml-rails', '~> 0.3.4'

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
  gem 'factory_girl_rails', '~> 4.0.0'
  gem 'fakeweb'
  gem "launchy"
end

group :development, :test do
  gem 'rspec-rails', '~> 2.11.0'
  gem 'guard-rspec', '~> 1.2.1'
  gem 'spork', '~> 1.0rc'

  gem "guard-spork", '~> 1.1.0'
  gem "guard-bundler"
  gem 'capybara'
  gem "capybara-webkit"
  gem 'cucumber-rails', require: false

  gem 'rb-fsevent', '~> 0.9.1'
  gem 'pry'
  # gem 'growl' # also install growlnotify from the Extras/growlnotify/growlnotify.pkg in Growl disk image
end

group :development do
  gem 'foreman'
end
