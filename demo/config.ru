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

visualization_titles = {
  elections_2016: "Elections 2016",
	london_population: "London Population",
	london_population_area: "London Population - Area Chart",
	olympics_2016_medals: "Olympics 2016 Medals",
}

visualization_titles.each do |script, title|
  get "/v/#{script}" do
    erb :visualization, {}, {script: script, title: title}
  end
end

run Sinatra::Application
