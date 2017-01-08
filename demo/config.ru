require "bundler"
Bundler.require

opal = Opal::Server.new do |s|
  s.append_path "app"
  s.append_path "assets"
end

map "/assets" do
  run opal.sprockets
end

visualizations = {
  elections_2016: "Elections 2016",
	london_population: "London Population",
	london_population_area: "London Population - Area Chart",
	olympics_2016_medals: "Olympics 2016 Medals",
  iphones: "iPhones",
  polish_pms: "Polish Prime Ministers",
  man_vs_horse: "Man versus Horse Marathon",
  paradox: "Paradox Interactive Games",
}

visualizations.each do |script, title|
  get "/v/#{script}" do
    erb :visualization, {}, {script: script, title: title}
  end
end

get "/" do
  erb :index, {}, {visualizations: visualizations}
end

run Sinatra::Application
