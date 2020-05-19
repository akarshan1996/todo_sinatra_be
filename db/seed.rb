require_relative '../environments.rb'
require_relative '../models/Todo'

Todo.destroy      #deletes all records from the relation
Todo.create({:id => 1, :title => 'Listen songs', :completed => false})    #Creates one record in the relation
Todo.create({:id => 2, :title => 'Play piano at 5', :completed => false})  
Todo.create({:id => 3, :title => 'Write test cases', :completed => false})  
Todo.create({:id => 4, :title => 'Do exercise at 6', :completed => false})  
