require 'sinatra'

NAV = "<div><a href='/'>Home</a> | <a href='/new'>Create a note</a></div>"

get '/new' do
  "<!doctype html><html><body>#{NAV}<form method='post'>Title<br /><input type='text' name='title'><br />Your notes<br /><textarea name='body'></textarea><br /><input type='submit' value='Create Note' /></body></html>"
end

post '/new' do
  file = File.open("data/note-#{Time.now.strftime "%Y%m%d%H%M%S"}.txt", 'w')
  file.puts params[:title]
  file.puts params[:body]
  file.close
  "#{NAV}saved the note '#{params[:title]}'."
end

get '/' do
  html = "<!doctype html><html><body>#{NAV}"
  Dir.glob("data/*.txt").reverse.each do |f|
    title = File.readlines(f)[0]
    html = "#{html} <a href='/show/#{f.split('-')[-1].split('.')[0]}'>#{title}</a><br />"
  end
  html + "</body></html>"
end

get '/show/:timestamp' do
  lines = File.readlines("data/note-#{params[:timestamp]}.txt")
  "#{NAV}<h1>#{lines[0]}</h1><p>#{lines[1..-1].join('<br />')}</p>"
end
