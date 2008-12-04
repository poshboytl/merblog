class Article
  include DataMapper::Resource
  include MerbPaginate::Finders::Datamapper
  
  property :id, Serial

  property :slug, String
  property :created_at, DateTime
  property :body, Text, :lazy => false # work around solution, fixed in the future
  property :title, String
  property :updated_at, DateTime
  
  has n, :comments
  
  # before :valid?, :set_permalink

  # our callback needs to accept the context used in the validation,
  # even if it ignores it, as #save calls #valid? with a context.
  def set_permalink(context = :default)
    self.slug = title.gsub(/\s+/,'_')
  end
end
