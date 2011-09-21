require 'sinatra'

NAV = "<div><a href='/'>Home</a> | <a href='/new'>Create a note</a></div>"

get '/new' do
  erb :new
end

post '/new' do
  file = File.open("data/note-#{Time.now.strftime "%Y%m%d%H%M%S"}.txt", 'w')
  file.puts params[:title]
  file.puts params[:body]
  file.close
  "#{NAV}saved the note '#{params[:title]}'."
end

get '/' do
  @notes = []
  Dir.glob("data/*.txt").reverse.each do |f|
    timestamp = f.split('-')[-1].split('.')[0]
    title = File.readlines(f)[0]
    @notes << [title, timestamp]
  end
  erb :index
end

get '/show/:timestamp' do
  lines = File.readlines("data/note-#{params[:timestamp]}.txt")
  "#{NAV}<h1>#{lines[0]}</h1><p>#{lines[1..-1].join('<br />')}</p>"
end

get '/delete/:timestamp' do
  File.delete("data/note-#{params[:timestamp]}.txt")
  redirect "/"
end


get '/edit/:timestamp' do
  lines = File.readlines("data/note-#{params[:timestamp]}.txt")
  title = lines[0]
  body = lines[1..-1].join("\n")
  "<!doctype html><html><body>#{NAV}<form method='post'>Title<br /><input value='#{title}' type='text' name='title'><br />Your notes<br /><textarea name='body'>#{body}</textarea><br /><input type='submit' value='Update Note' /></body></html>"
end

post '/edit/:timestamp' do
  file = File.open("data/note-#{params[:timestamp]}.txt", 'w')
  file.puts params[:title]
  file.puts params[:body]
  file.close
  "#{NAV}saved the note '#{params[:title]}'."
end
