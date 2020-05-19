# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/akarshan1996/todo_sinatra_be" }

group :production do

end


group :development do           # bundle install --without production
gem 'sinatra', "~>1.2"

gem "sinatra-contrib", "~>1.0"

gem "data_mapper", "~> 1.2"

gem "dm-postgres-adapter", "~> 1.2"

gem "pg", "~> 1.2"

gem "sinatra-cross_origin", "~> 0.4.0"

gem "rack", "~> 1.6"

# gem "sinatra-json", "0.1.0"

# gem "rerun", "~> 0.13.0"

# gem "ffi", "~> 1.9.25"

gem "shotgun", "~> 0.9.2"
end

group :test do
#  gem 'database_cleaner'
 gem 'rspec'
 gem 'rack-test'
end