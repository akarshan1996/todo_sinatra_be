#Set up your config.ru file to load the bundle before it loads your Sinatra app.

require 'rubygems'
require 'bundler'
Bundler.require             #loops over each gem in your Gemfileand requires all gem entries

require './environments.rb'
require './models/Todo'
require './todo_sinatra'

run App.new


#Start your development server with rackup, and Sinatra will be loaded via Bundler.
#$ bundle exec rackup


#Essentially, if you would normally have run something like rspec spec/my_spec.rb, and you want to use the gems specified in the Gemfile(5)
# and installed via bundle install(1), you should run bundle exec rspec spec/my_spec.rb.