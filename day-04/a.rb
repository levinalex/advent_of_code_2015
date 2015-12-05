#!/usr/bin/env ruby


require "digest/md5"

length = ARGV.shift.to_s
seed = ARGF.read.chomp
i = 0

loop do
  str = seed + i.to_s
  digest = Digest::MD5.hexdigest(str)

	if digest =~ /^0{#{length}}/
		puts i
		break
	end
  i += 1
end


