source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.3.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'devise', '~> 3.4.1'

gem 'thin', '~> 1.6.3'

gem 'slim', '~> 3.0.3'
gem 'slim-rails', '~> 3.0.1'

gem 'carrierwave', '~> 0.10.0'

gem 'draper', '~> 2.1.0'

### TESTING ###
# So what did we just install?
# rspec-rails - includes RSpec itself in a wrapper to make it play nicely with Rails 3.
# factory_girl_rails - replaces Rails’ default fixtures for feeding test data to the test suite with much more preferable factories.
# faker - generates names, email addresses, and other placeholders for factories.
# capybara - makes it easy to programatically simulate your users’ interactions with your application.
# launchy - does one thing, but does it well: It opens your default web browser upon failed integration specs to show you what your application is rendering.
# guard-rspec - watches your application and tests and runs specs for you automatically when it detects changes.
#- See more at: http://everydayrails.com/2012/03/12/testing-series-rspec-setup.html#sthash.J2aNeaQq.dpuf

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
  gem 'byebug'
  gem 'dotenv-rails'
end
group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end
group :development do
  gem 'spring'
end

