source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.6'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Devise for Website Users
gem 'devise', '~> 4.4'
# Use ValidEmail2 to check MX record on emails
gem 'valid_email2', '~> 2.2'
# Use phonyrails for normalizing and validating phone numbers
gem 'phony_rails', '~> 0.14'
# Use CanCanCan for permissions
gem 'cancancan', '~> 2.0'

# Use bootstrap for CSS components
gem 'bootstrap', '~> 4.1.1'
# Use bootstra devise views
gem 'devise-bootstrapped', github: 'king601/devise-bootstrapped', branch: 'bootstrap4'

# Use respond_to in controllers and respond_with
gem 'responders', '~> 2.4'

# Use Rails Settings for Project Site Settings
gem "rails-settings-cached", '~> 0.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Better printing of ruby objects
  gem 'awesome_print', '~> 1.8', require: 'ap'

  # Replace rails testing with rspec
  gem 'rspec-rails', '~> 3.7'
  # Test controllers using assigns
  gem 'rails-controller-testing', '~> 1.0'
  # Create database objects during testing with ease
  gem 'factory_bot_rails', '~> 4.10'
  # Capybara can't run in a transaction because of AJAX
  gem 'database_cleaner', '~> 1.7'
  # Use FFaker for random value generation
  gem 'ffaker', '~> 2.9'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Replace rails default error pages
  gem 'better_errors', '~> 2.4'
  # Advanced features of better errors
  gem 'binding_of_caller', '~> 0.8'

  # Use rubocop to check style
  gem 'rubocop', '~> 0.58', require: false
  # Check style for tests
  gem 'rubocop-rspec', require: false 
  # Lock down the formatting of schema.rb
  gem 'fix-db-schema-conflicts', '~> 3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
