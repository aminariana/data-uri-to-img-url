source 'https://rubygems.org'
ruby '2.3.3'                              # Ruby language

gem 'rails', '~> 5'

# Database
gem 'pg'                                  # PostgreSQL

group :production do
  gem 'rails_12factor'                    # Heroku Asset Pipeline
end

group :development, :test do
  gem 'rspec-rails'                       # Behavior Driven Development
end

group :development do
  gem 'annotate'                          # Annotate routes and models
end
