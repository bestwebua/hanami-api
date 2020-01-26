source 'https://rubygems.org'

gem 'rake', '~> 13.0', '>= 13.0.1'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'pg', '~> 1.2', '>= 1.2.2'
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'fast_jsonapi', '~> 1.5'

group :development do
  gem 'shotgun', '~> 0.9.2', platforms: :ruby
  gem 'hanami-webconsole', '~> 0.1.0'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'pry', '~> 0.12.2'
  gem 'ffaker', '~> 2.13'
  gem 'factory_bot', '~> 5.1', '>= 5.1.1'
end

group :test do
  gem 'rspec', '~> 3.9'
  gem 'database_cleaner', '~> 1.7'
end

group :production do
  # gem 'puma'
end
