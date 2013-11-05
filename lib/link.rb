class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :uri, String
  property :description, String

end