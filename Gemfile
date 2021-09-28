source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rack-cors'
gem 'rswag'
gem 'devise'
gem 'devise_token_auth'
gem 'dry-validation'
gem 'dry-monads'
gem 'dry-matcher'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'annotate'
  gem 'bullet'
end
