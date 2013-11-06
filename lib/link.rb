class Link
  include DataMapper::Resource

  has n, :tags, :through => Resource

  property :id, Serial
  property :title, String
  property :uri, String
  property :description, Text

end