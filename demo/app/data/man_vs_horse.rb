require "ostruct"

ManVsHorse = [
  [2016, "Horse", "Lindsey Walters", "Deliva Crianza", "2:17:58", "Ross MacDonald", "2:37:51"],
  [2015, "Horse", "Geoffrey Allen", "Leo", "2:20:46", "Hugh Aggleton", "2:30:35"],
  [2014, "Horse", "Geoffrey Allen", "Leo", "2:22:53", "Jonathan Albon", "2:42:49"],
  [2013, "Horse", "Beti Gordon", "Next in line Grangeway", "2:18:03", "Hugh Aggleton", "2:46:25"],
  [2012, "Horse", "Iola Evans", "Rheidol Star", "2:00:51", "Huw Lobb", "2:25:57"],
  [2011, "Horse", "Beti Gordon", "Next in line Grangeway", "2:08:37", "Charlie Pearson", "2:25:45"],
  [2010, "Horse", "Llinos Mair Jones", "Sly Dai", "2:07:04", "Haggai Chepkwony", "2:17:27"],
  [2009, "Horse", "Geoffrey Allen", "Dukes Touch of Fun", "2:11:43", "Martin Cox", "2:20:02"],
  [2008, "Horse", "Geoffrey Allen", "Dukes Touch of Fun", "2:18:13", "John Macfarlane", "2:18:43"],
  [2007, "Human", "Geoffrey Allen", "Lucy", "2:31:26", "Florian Holzinger", "2:20:30"],
  [2006, "Horse", "Denise Meldrum", "Tarran Bay", "2:10:29", "Haggai Chepkwony", "2:19:06"],
  [2005, "Horse", "Lise Cooke", "Gifted Lady", "2:19:11", "Stephen Goulding", "2:33:22"],
  [2004, "Human", "Zoe White", "Kay Bee Jay", "2:07:36", "Huw Lobb", "2:05:19"],
  [2003, "Horse", "Robyn Petrie-Ritchie", "Druimguiga Shemal", "2:02:01", "Mark Croasdale", "2:19:02"],
  [2002, "Horse", "Robyn Petrie-Ritchie", "Druimguiga Shemal", "2:02:23", "James McQueen", "2:18:52"],
  [2001, "Horse", "Heather Evans", "Royal Mikado", "2:08:06", "Martin Cox", "2:17:17"],
  [2000, "Horse", "Heather Evans", "Royal Mikado", "2:08", "Mark Croasdale", "2:10"],
  [1999, "Horse", "Jackie Gilmour", "Ruama", "1:58", "Mark Palmer", "2:16"],
  [1998, "Horse", "Jackie Gilmour", "Ruama", "1:46", "Stuart Major", "2:16"],
  [1997, "Horse", "Megan Lewis", "unknown", "1:52", "Paul Cadwallader", "2:09"],
  [1996, "Horse", "Ken Mapp", "Ahmaar", "1:57", "Mark Palmer", "2:12"],
  [1995, "Horse", "Ken Mapp", "Ahmaar", "1:57", "Paul Cadwallader", "2:06"],
  [1994, "Horse", "Celia Tymons", "Eskalabar", "1:52", "Mark Croasdale", "2:09"],
  [1993, "Horse", "John Hudson", "unknown", "1:47", "Robin Bergstrand", "2:03"],
  [1992, "Horse", "Zoe Jennings", "Hussar", "1:38", "Derek Green", "2:09"],
  [1991, "Horse", "Zoe Jennings", "Hussar", "1:30", "Mark Croasdale", "2:05"],
  [1990, "Horse", "Ray Jenkins", "The Doid", "1:36", "Glyn Williams", "2:07"],
  [1989, "Horse", "Ray Jenkins", "The Doid", "1:54", "Mark Croasdale", "2:10"],
  [1988, "Horse", "John Davies", "Mavies", "1:47", "Mark Croasdale", "2:08"],
  [1987, "Horse", "Ray Jenkins", "The Doid", "1:32", "Paul Wheeler", "1:57"],
  [1986, "Horse", "Nia Tudno-Jones", "Jenny", "1:44", "Fuselier Hughes", "2:08"],
  [1985, "Horse", "Nia Tudno-Jones", "Jenny", "1:40", "David Woodhead", "2:08"],
  [1984, "Horse", "William Jones", "Solitaire", "1:20", "David Woodhead", "2:05"],
  [1983, "Horse", "Ann Thomas", "Nutmeg", "1:26", "Dic Evans", "2:02"],
  [1982, "Horse", "Sue Thomas", "Simon", "2:06", "Paul Brownson", "2:10"],
  [1981, "Horse", "Clive Powell", "Sultan", "2:02", "Dic Evans", "2:24"],
  [1980, "Horse", "Glyn Jones", "Solomon", "1:27", "Dic Evans", "2:10"],
].map{|y,w,rn,hn,ht,mn,mt|
  h,m,s = ht.split(":").map(&:to_i)
  ht = h*60+m+(s||0)
  h,m,s = mt.split(":").map(&:to_i)
  mt = h*60+m+(s||0)
  OpenStruct.new(
    year: y,
    winner: w,
    rider: rn,
    horse: hn,
    horse_time: ht,
    human: mn,
    human_time: mt,
  )
}
