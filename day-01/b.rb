#!/usr/bin/env ruby

count = 0

puts ARGF.each_char.
	map { |c| Hash["(",1,")",-1][c] }.compact.
	each_with_index { |n,i|
		break i if count < 0
		count += n
	}
