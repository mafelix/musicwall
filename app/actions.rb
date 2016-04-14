# Homepage (Root path)
require 'pry'
enable:sessions

helpers do
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
get '/' do
  erb :'index'
end

get '/musics/index' do
  @musics = Music.all
  # @song_title = Music.all[0].song_title
  erb :'/musics/index' 
end

get '/signup/signup' do
  erb :'/signup/signup'
end

get '/signin/signin' do
  erb :'/signin/signin'
end

get '/musics/new' do
  @music = Music.new
  erb :'musics/new'
end

get '/logout' do
  session.clear
  redirect '/'
end
post '/musics/new' do
  @music = Music.new(
    song_title: params[:song_title],
    url: params[:url],
    author: params[:author]
    )
  @music.save
  redirect '/musics/index'
end


post '/signup/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )
  @user.save
  redirect '/signin/signin'
end

post '/signin/signin' do
  @user = User.find_by(
    email: params[:email],
    password: params[:password]
    )
  if @user != nil && @user.password = params[:password]
    session[:user_id] = @user.id
    redirect '/musics/index'
  else
    session[:flash] ="Invalid email or password"
    erb :'/signin/signin'
  end
end

get '/musics/delete/:id' do
  @music = Music.find(params[:id])
  if !@music.nil?
    @music.delete
    redirect '/musics/index'
  else 
    session[:flash]="Invalid video to delete"
    redirect '/musics/index'
  end
end