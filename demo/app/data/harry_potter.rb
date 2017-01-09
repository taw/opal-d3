require "ostruct"
require "time"

# Pages for UK releases, according to Harry Potter wikia
HarryPotterBooks = [
  ["Philosopher's Stone", "1997-06-26", 223],
  ["Chamber of Secrets", "1998-07-02", 251],
  ["Prisoner of Azkaban", "1999-07-08", 317],
  ["Goblet of Fire", "2000-07-08", 636],
  ["Order of the Phoenix", "2003-06-21", 766],
  ["Half-Blood Prince", "2005-07-16", 607],
  ["Deathly Hallows", "2007-07-21", 610],
].map do |title, time, pages|
  OpenStruct.new(
    title: title,
    date: Time.parse(time),
    pages: pages
  )
end
