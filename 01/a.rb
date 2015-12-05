#!/usr/bin/env ruby

vals = { "(" => 1, ")" => -1 }
txt = ARGF.read
res = txt.
        split(//).
        map { |c| vals[c] }.
        compact.
        inject(0) { |a,b| a+b }

puts res
