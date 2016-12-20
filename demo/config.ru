require "bundler"
Bundler.require

opal = Opal::Server.new do |s|
  s.append_path "app"
  s.append_path "assets"
end

map "/assets" do
  run opal.sprockets
end

get "/" do
  send_file "index.html"
end

get "/v/:name" do
  send_file "#{params[:name]}.html"
end

run Sinatra::Application
