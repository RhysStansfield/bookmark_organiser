require 'sinatra/base'
require 'sinatra/partial'
require 'rack-flash'

require_relative 'link'
require_relative 'tag'

class BookmarkManager < Sinatra::Base

  register Sinatra::Partial
  use Rack::Flash

  enable :sessions
  set :partial_template_engine, :erb
  set :session_secret, 'ultramegasecret'

  set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
    if session[:just_logged_out]
      flash.now[:notice] = "Alright, fuck off then!"
      session.clear
    end
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

  get '/search' do
    tag = session[:tag]
    session[:tag] = nil
    @links = tag ? tag.links : []
    erb :index
  end


  post '/search' do
    session[:tag] = Tag.first(:text => params[:tagsearch])
    redirect to('/search')
  end

  get '/users/new' do
    @user = User.new
    @user.email = session[:email]
    flash.now[:errors] = session[:errors]
    session[:errors] = nil
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(email: params['email'],
      password: params['password'],
      password_confirmation: params['password_confirmation'])
    if @user.save
      session[:user_id] = @user.id
      session[:email] = nil
      redirect to('/')
    else
      session[:errors] = @user.errors.full_messages
      session[:email] = params['email']
      redirect to('/users/new')
    end
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = "The email or password are incorrect"
      erb :"sessions/new"
    end
  end

  post '/log_out' do
    session.clear
    session[:just_logged_out] = true
    redirect to('/')
  end

  get '/reset_password' do
    erb :new_password
  end

  post '/reset_password' do
    user = User.first(email: params[:email])
    user.password_token = Array.new(64) { (65 + rand(58)).chr }
    user.password_token_timestamp = Time.now
    user.save
  end

  get '/users/reset_password/:token' do
  end

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
