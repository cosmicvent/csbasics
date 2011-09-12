require 'sinatra'

#/sum/test/foo
#params[:first] = "test"
#params[:second] = "foo"

#Rs 100.5043

get '/sum/:first/:second' do
  #/sum/232/214
  #params[:first] = "232"
  #params[:second] = "214"
  sum = params[:first].to_i + params[:second].to_i
  "<!doctype html><html><head><title>Sinatra Welcome</title></head><body><h1>The sum of #{params[:first]} and #{params[:second]} is #{sum}</h1></body></html>"
end

get '/' do
  response_string = "<!doctype html><html><head><title>Sinatra Welcome</title></head><body><h1>Welcome to sinatra</h1></body></html>"
  response_string
end

get '/contact.html' do
  "<h1>Contact page</h2>"
end

get '/contact.aspx' do
  "<h1>Contact page</h2>"
end
get '/contact.jsp' do
  "<h1>Contact page</h2>"
end
get '/contact.php' do
  "<h1>Contact page</h2>"
end
get '/contact' do
  "<h1>Contact page</h2>"
end

get "/compute-age" do
  "<!doctype html><html><head><title>Calculator</title></head><body><h1>Calculator</h1><form method='post'>Enter date(1985-05-23):<input name='dob' type='text' /><input type='submit' value='Compute age' /></form></body></html>"
end

post "/compute-age" do
  tokens = params[:dob].split("-")
  age_text = compute_age(tokens[0].to_i, tokens[1].to_i, tokens[2].to_i)
  return age_text
end


get '/age/:days/:month/:year' do
  age_text = compute_age(params[:year].to_i,params[:month].to_i,params[:days].to_i)
  "Your DOB is #{params[:days]}-#{params[:month]}-#{params[:year]}. #{age_text}"
end

def compute_age(year, month, days)
  current_time = Time.now
  dob = Time.new(year,month,days)
  age = current_time - dob
  total_days = (age / (24 * 60 * 60)).round
  years = (total_days/365).round
  rem_days = total_days % 365
  months = (rem_days/30).round
  days = rem_days % 30
  return "Your age is <em>#{years} years #{months} months #{days} days</em>"
end
