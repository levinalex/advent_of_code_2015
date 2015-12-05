#!/usr/bin/env ruby

vals = { "(" => 1, ")" => -1 }
ARGF.read.
        split(//).
        map { |c| vals[c] }.
        compact.
        inject([0,0]) { |(a,idx),b|
          if a < 0
            puts idx
            break
          end
          [a+b, idx+1]
        }

