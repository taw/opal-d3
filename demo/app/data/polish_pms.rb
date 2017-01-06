require "ostruct"
require "time"

PolishPMs = [
  ["Tadeusz Mazowiecki",      "UD",  "1989-08-24", "1991-01-04"],
  ["Jan Krzysztof Bielecki",  "KLD", "1991-01-04", "1991-12-06"],
  ["Jan Olszewski",           "PC",  "1991-12-06", "1992-06-05"],
  ["Waldemar Pawlak",         "PSL", "1992-06-05", "1992-07-11"],
  ["Hanna Suchocka",          "UD",  "1992-07-11", "1993-10-26"],
  ["Waldemar Pawlak",         "PSL", "1993-10-26", "1995-03-07"],
  ["Józef Oleksy",            "SLD", "1995-03-07", "1996-02-07"],
  ["Włodzimierz Cimoszewicz", "SLD", "1996-02-07", "1997-10-31"],
  ["Jerzy Buzek",             "AWS", "1997-10-31", "2001-10-19"],
  ["Leszek Miller",           "SLD", "2001-10-19", "2004-05-02"],
  ["Marek Belka",             "SLD", "2004-05-02", "2005-10-31"],
  ["Kazimierz Marcinkiewicz", "PiS", "2005-10-31", "2006-07-14"],
  ["Jarosław Kaczyński",      "PiS", "2006-07-14", "2007-11-16"],
  ["Donald Tusk",             "PO",  "2007-11-16", "2014-09-22"],
  ["Ewa Kopacz",              "PO",  "2014-09-22", "2015-11-16"],
  ["Beata Szydło",            "PiS", "2015-11-16", "2017-01-06"],
].map{|n,p,s,e|
  OpenStruct.new(
    name: n,
    party: p,
    start: Time.parse(s),
    end: Time.parse(e),
  )
}
