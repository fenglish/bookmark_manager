ENV['RACK_ENV']||='development'
require 'sinatra/base'
require './models/link.rb'
require './models/tag.rb'
require_relative './models/database_setting.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
    redirect '/links/new'
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    @link_tag = LinkTag.all
    erb :"links/index"
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(tag_name: params[:tag])
    LinkTag.create( :link => link, :tag => tag )
    redirect '/links'
  end

  get '/tags/:name' do
    @links = Link.all
    @tags = Tag.all
    @link_tag = LinkTag.all
    tag_ids = []
    link_ids = []
    tag_ids = @tags.map{ |tag| tag.id if tag.tag_name == params[:name] }
    tag_ids.map do | tag_id |
       @link_tag.each do | link_tag |
          link_ids << link_tag.link_id if link_tag.tag_id == tag_id
        end
     end
     @links_by_tag = []
     link_ids.each do |link_id|
       @links_by_tag << @links.all(id: link_id)
     end
    # tag_ids.map do |tag_id|
    #   @link_tag.url_id if tag_id == @link_tag.tag_id
    # end
    erb :"links/index"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
