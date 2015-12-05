#!/usr/bin/env ruby


require "digest/md5"

seed = "ckczppom"

i = 0

loop do
  str = seed + i.to_s
  digest = Digest::MD5.hexdigest(str)

  if digest =~ /^0{5}/
    puts i
    exit
  end
  i += 1
end


