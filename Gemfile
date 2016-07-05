source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'

# Use mongoid gem
gem 'mongoid',  github: 'mongoid/mongoid'
gem 'bson_ext'
gem 'simple_enum', '~> 2.3.0' , require: 'simple_enum/mongoid'

gem 'bootstrap-sass', '~> 3.3.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'typescript-rails'
gem 'angularjs-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Authentication gem
gem 'devise'
gem 'devise-i18n'

gem 'scss_lint', require: false
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-secrets-yml', '~> 1.0.0'
end

#gem 'capitate'

gem 'puma'

# Call 'byebug' anywhere in the code to stop execution and get a debugger console
gem 'byebug'

# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0', group: :development

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring'

gem "i18n-js", ">= 3.0.0.rc11"

gem 'countries', :require => 'countries/global'
gem 'i18n_country_select', '~> 1.1', '>= 1.1.5'

gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'

group :development, :test do
    gem 'capybara'
    gem 'selenium-webdriver'
end
