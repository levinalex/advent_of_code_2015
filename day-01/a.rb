#!/usr/bin/env ruby

puts ARGF.each_char.
  map { |c| { "(" => 1, ")" => -1 }[c] }.
  compact.
  inject(&:+)

