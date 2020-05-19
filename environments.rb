require 'sinatra'
require 'data_mapper' 
require "dm-postgres-adapter" 
require "pg" 

configure :development do
    # set :database, "sqlite:///dev.db"
    puts "\nNOTE: Inside Development\n\n"
    DataMapper.setup(:default, "postgres://localhost/akarshan.gupta")
    set :show_exceptions, true
end
  
configure :production do
  puts "\nNOTE: Inside Production\n\n"
  db = URI.parse(ENV["DATABASE_URL"] || 'postgres://productionurl/databasename')

  DataMapper.setup(:default, db)

end

configure :test do
  puts "\nNOTE: Inside test\n\n"
  db = URI.parse(ENV["DATABASE_URL"] || 'postgres://localhost/todos_test_db')

  DataMapper.setup(:default, db)

end