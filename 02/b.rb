#!/usr/bin/env ruby

module Enumerable
  def sum
    inject(0) { |a,b| a+b }
  end
end

def ribbon(a,b,c)
  sides = [a,b,c].sort

  length = sides[0] + sides[1]
  slack = a*b*c

  return length * 2 + slack
end

dimensions = ARGF.each_line.map { |l| l.split("x").map(&:to_i) }
res = dimensions.map { |d| ribbon(*d) }.sum

puts res





