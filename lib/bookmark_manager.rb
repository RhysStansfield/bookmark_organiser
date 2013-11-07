require 'sinatra/base'
require 'rack-flash'

require_relative 'link'
require_relative 'tag'

class BookmarkManager < Sinatra::Base

  use Rack::Flash

  enable :sessions
  set :session_secret, 'ultramegasecret'

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

  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = tag ? tag.links : []
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation'])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
