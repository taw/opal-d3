require "ostruct"
require "time"

# Pages for UK releases, according to Harry Potter wikia
HarryPotter = [
  ["Harry Potter and the Philosopher's Stone", "1997-06-26", 223],
  ["Harry Potter and the Chamber of Secrets", "1998-07-02", 251],
  ["Harry Potter and the Prisoner of Azkaban", "1999-07-08", 317],
  ["Harry Potter and the Goblet of Fire", "2000-07-08", 636],
  ["Harry Potter and the Order of the Phoenix", "2003-06-21", 766],
  ["Harry Potter and the Half-Blood Prince", "2005-07-16", 607],
  ["Harry Potter and the Deathly Hallows", "2007-07-21", 610],
].map do |title, time, pages|
  OpenStruct.new(
    title: title,
    date: Time.parse(time),
    pages: pages
  )
end
