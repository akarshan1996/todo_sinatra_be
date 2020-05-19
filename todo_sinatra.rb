# todo_sinatra.rb
#https://www.rubydoc.info/github/datamapper/dm-core/DataMapper/Property Documentation of DataMapper
ENV['RACK_ENV'] ||= 'development'

require 'data_mapper' 
require "dm-postgres-adapter" 
require "pg"
require 'pp'  # Pretty print
require 'sinatra/json' # gem install sinatra-contrib
require 'sinatra/cross_origin'
require 'sinatra/base'


class App  < Sinatra::Base
  set :show_exceptions, :after_handler      #Enabling exceptions in the application

  before do
    content_type :json
    response.headers["Access-Control-Allow-Origin"] = 'http://localhost:8080'
    response.headers["Access-Control-Allow-Headers"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  options "*" do
    # response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Origin"] = '*'
    200
  end

  #Display all todos
  get '/todos' do
    todos =json  Todo.all    #Returns a new Collection optionally scoped by query.
  end

  #Make a new todo
  post '/todo/new' do
    newtodo = JSON.parse request.body.read  #reads request body
    puts newtodo['todo']
    todo = Todo.new(newtodo['todo'])        #Initializes a Resource and appends it to the Collection.
    saved = todo.save
    if saved
      puts "Todo saved: #{saved}"
      status 200
      json 'message' => 'Todo saved', 'todo' => todo
    else 
      status 400
      json 'error' => 'Some error occured', 'todo' => {}
    end
  end

  # Changes boolean complete.
  put '/todo/:id/completed' do |id|
    todo = Todo.get!(id)    #Lookup a Resource in the Collection by key, raising an exception if not found.
    todo.completed = !todo.completed
    saved = todo.save               #Save every Resource in the Collection.
    if saved
      puts "Todo completion status changed: #{saved}"
      status 200
      json 'message' => 'Todo completion status changed'
    else 
      status 400
      json 'error' => 'Some error occured'
    end
  end

  #delete verb to delete record in the db
  delete '/todo/:id' do |id|
    todo = Todo.get!(id)  #Lookup a Resource in the Collection by key, raising an exception if not found.
    deleted = todo.destroy!         #Remove all Resources from the repository, bypassing validation.
    if deleted
      puts "Todo Deleted: #{deleted}"
      status 200
      json 'message' => 'Todo deleted'
    else 
      status 400
      json 'error' => 'Some error occured'
    end
  end

  #delete verb to delete all records in the db
  delete '/delete/all' do
    deleted = Todo.destroy         #Remove all Resources from the repository, bypassing validation.
    if deleted
      puts "All Todo Deleted: #{deleted}"
      status 200
      json 'message' => 'Todo deleted'
    else 
      status 400
      json 'error' => 'Some error occured'
    end
  end
end