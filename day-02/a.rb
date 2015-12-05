#!/usr/bin/env ruby

def paper(a,b,c)
  sides = [a*b,b*c,c*a]
  slack = sides.min

  sides.inject(&:+) * 2 + slack
end

dimensions = ARGF.each_line.map { |l| l.split("x").map(&:to_i) }

res = dimensions.map { |d| paper(*d) }.inject(&:+)

puts res





