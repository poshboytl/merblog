class Comment
  include DataMapper::Resource
  
  property :id, Serial

  property :name, String
  property :created_at, DateTime
  property :body, Text, :lazy => false
  property :email, String

end
