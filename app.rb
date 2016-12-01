ENV['RACK_ENV']||='development'
require 'sinatra/base'
require './models/link.rb'
require './models/tag.rb'
require_relative './models/database_setting.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    @links = Link.all
    erb :"links/index"
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    @tags = params[:tag].split(" ")
    @tags.each do |tag|
      tag1 = Tag.create(tag_name: tag)
      LinkTag.create( :link => link, :tag => tag1 )
    end
    redirect '/links'
  end

  get '/tags/:name' do
    @tag = Tag.all(tag_name: params[:name])
    @links = @tag.links
    erb :"links/index"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
