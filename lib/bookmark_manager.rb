require 'sinatra/base'

require_relative 'link'
require_relative 'tag'

class BookmarkManager < Sinatra::Base

  set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
    @links = Link.all
    erb :index
  end

  get '/add_link' do
    erb :add_link
  end

  post '/add_link' do
    Link.new
    uri = params['uri']
    title = params['title']
    description = params['description']
    tags = params['tags'].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
    end
    Link.create({uri: uri, title: title, description: description, tags: tags})
    redirect to('/')
  end

  get '/tags' do
    @tags = Tag.all
    erb :tags
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
