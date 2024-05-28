require 'sinatra'
require 'curb'
require 'json'

get '/' do
  api_key = 'b0c17454395e1db0360dd8382332e2f4'
  city = params[:city] || 'London' # Default to 'London' if no city is provided
  req = Curl::Easy.perform("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&appid=#{api_key}")
  res = req.body_str
  @data = JSON.parse(res)
  erb :index
end
