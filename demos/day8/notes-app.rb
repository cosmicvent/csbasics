require 'sinatra'
require './note'

get '/new' do
  erb :new
end

post '/new' do
  note = Note.new(Time.now.strftime("%Y%m%d%H%M%S"), params[:title], params[:body])
  note.save
  redirect '/'
end

get '/' do
  @notes = Note.find_all
  erb :index
end

get '/show/:id' do
  @note = Note.find(params[:id])
  erb :show
end

get '/delete/:id' do
  Note.delete(params[:id])
  redirect "/"
end


get '/edit/:id' do
  @note = Note.find(params[:id])
  erb :edit
end

post '/edit/:id' do
  note = Note.new(params[:id], params[:title], params[:body])
  note.save
  redirect '/'
end
