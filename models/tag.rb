require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'database_setting.rb'

class Tag
  include DataMapper::Resource
  property :id, Serial
  property :tag_name, String

  has n, :links, :through => Resource
end
