# Homepage (Root path)
get '/' do
  erb :index
end

get '/musics' do
  @musics = Music.all
  erb :'/musics/index' 
end

get '/musics/new' do
  @music = Music.new
  erb :'musics/new'
end

post '/musics' do
  @music = Music.new(
    song_title: params[:song_title],
    url: params[:url],
    author: params[:author]
    )
  @music.save
  redirect '/musics'
end

