require "ostruct"

Elections2016 = [
  { name: "Donald Trump", votes: 62_979_879, color: "#ff8c00" },
  { name: "Hillary Clinton", votes: 65_844_954, color: "#98abc5" },
  { name: "Gary Johnson", votes: 4_488_919, color: "#8a89a6" },
  { name: "Jill Stein", votes: 1_457_044, color: "#7b6888" },
  { name: "Evan McMullin", votes: 725_902, color: "#6b486b" },
  { name: "Darrell Castle", votes: 202_979, color: "#a05d56" },
].map{|o| OpenStruct.new(o) }
