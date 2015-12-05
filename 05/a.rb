#!/usr/bin/env ruby


nice_rx = [
  /(?:[aeiou].*){3,}/,
  /(.)\1/,
]

naughty_rx = [
  /(ab|cd|pq|xy)/,
]

count = 0


ARGF.each_line do |l|
  is_nice =
    nice_rx.all? { |rx| l =~ rx } &&
    naughty_rx.none? { |rx| l =~ rx }

  count += 1 if is_nice
end

puts count



