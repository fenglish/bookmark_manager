ENV['RACK_ENV']||='development'
require 'sinatra/base'
require './models/link.rb'
require './models/tag.rb'
require './models/user.rb'
require_relative './models/database_setting.rb'
require './models/encryption.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions

  helpers do
    def current_user
      User.first(id: session[:id])
    end
  end

  get '/' do
    erb :index
  end

  post '/sign-up' do
    user = User.create(email: params[:email], password: params[:password])
    session[:id] = user.id
    redirect '/links'
  end

  get '/links' do
    @user = current_user
    @links = Link.all
    erb :"links/index"
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    @user = current_user
    link = Link.create(url: params[:url], title: params[:title])
    @tags = params[:tag].split(" ")
    @tags.each do |tag|
      tag1 = Tag.create(tag_name: tag)
      LinkTag.create( :link => link, :tag => tag1 )
    end
    redirect '/links'
  end

  get '/tags/:name' do
    @user = current_user
    @tag = Tag.all(tag_name: params[:name])
    @links = @tag.links
    erb :"links/index"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
