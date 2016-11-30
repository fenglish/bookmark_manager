require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'database_setting.rb'
require_relative 'tag.rb'

class Link
  include DataMapper::Resource
  property :id, Serial
  property :url, String
  property :title, String

  has n, :tags, :through => Resource
end
