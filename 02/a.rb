#!/usr/bin/env ruby

module Enumerable
  def sum
    inject(0) { |a,b| a+b }
  end
end

def paper(a,b,c)
  sides = [a*b,b*c,c*a]
  slack = sides.min

  sides.sum * 2 + slack
end

dimensions = ARGF.each_line.map { |l| l.split("x").map(&:to_i) }

res = dimensions.map { |d| paper(*d) }.sum

puts res





