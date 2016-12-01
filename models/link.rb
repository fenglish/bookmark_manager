require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, Text
  property :title, String

  has n, :tags, :through => Resource
end
