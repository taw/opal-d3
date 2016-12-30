require "date"
require "time"
require "ostruct"

IPhones = [
  ["iPhone",         "2007-06-29", [4,8,16]],
  ["iPhone 3G",      "2008-07-11", [8,16]],
  ["iPhone 3GS",     "2009-06-19", [8,16,32]],
  ["iPhone 4",       "2010-06-24", [8,16,32]],
  ["iPhone 4S",      "2011-10-14", [8,16,32,64]],
  ["iPhone 5",       "2012-09-21", [16,32,64]],
  ["iPhone 5C",      "2013-09-20", [8,16,32]],
  ["iPhone 5S",      "2013-09-20", [16,32,64]],
  ["iPhone 6",       "2014-09-19", [16,64,128]],
  ["iPhone 6 Plus",  "2014-09-19", [16,64,128]],
  ["iPhone 6S",      "2015-09-25", [16,32,64,128]],
  ["iPhone 6S Plus", "2015-09-25", [16,32,64,128]],
  ["iPhone SE",      "2016-03-31", [16,64]],
  ["iPhone 7",       "2016-09-16", [32,128,256]],
  ["iPhone 7 Plus",  "2016-09-16", [32,128,256]],
].map{|n,d,s|
  OpenStruct.new(name: n, released: Time.parse(d), sizes: s)
}

IPhoneVariants = IPhones.flat_map do |i|
  i.sizes.map do |sz|
    OpenStruct.new(name: i.name, released: i.released, size: sz)
  end
end
