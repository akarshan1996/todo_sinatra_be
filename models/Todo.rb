
class Todo
    include DataMapper::Resource
    
    property :id,          String, key: true, unique_index: true
    property :title,      String
    property :completed,   Boolean
end

# DataMapper.auto_migrate!      #Run when model changes are there
DataMapper.auto_upgrade!