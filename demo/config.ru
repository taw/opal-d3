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
  weather_in_london: "Weather in London",
  harry_potter: "Harry Potter Books",
  mtg_modern_creatures: "MTG: Creatures in Modern",
  star_trek_voyager: "Star Trek: Voyager",
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
