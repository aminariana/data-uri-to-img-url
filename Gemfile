source 'https://rubygems.org'
ruby '2.0.0'                              # Ruby language

gem 'rails', '4.0.0'

# Javascript Libraries and CSS Rendering libraries
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.0'

group :production do
  gem 'pg'                                # PostgreSQL
  gem 'rails_12factor'                    # Heroku Asset Pipeline
end

group :development, :test do
  gem 'rspec-rails', '~> 2'               # Behavior Driven Development
  gem 'sqlite3', '~> 1.3.6'               # SQLite
end

group :development do
  gem 'annotate', '~> 2.4'                # Annotate routes and models
end
