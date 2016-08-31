# Homepage (Root path)
['/', '/index', '/song'].each do |route|
  get route do
    @songs = Song.all
    erb :index
  end
end

get '/new_song' do
  @song = Song.new
  erb :new_song
end

post '/new_song' do
  @song = Song.new(
  song_title:   params[:song_title],
  author:       params[:author],
  url:          params[:url]
  )
  if @song.save
    redirect '/index'
  else
    erb :'/new_song'
  end
end
