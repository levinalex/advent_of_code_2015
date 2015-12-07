#!/usr/bin/env ruby

module OPS
  def GET(x)
    x =~ /\d+/ ?  x.to_i : send("get_#{x}")
  end

  def CLAMP(v)
    v & (2**16 -1)
  end
  def AND(a, b)
    CLAMP(GET(a) & GET(b))
  end
  def OR(a, b)
    CLAMP(GET(a) | GET(b))
  end
  def RSHIFT(a, b)
    CLAMP(GET(a) >> GET(b))
  end
  def LSHIFT(a, b)
    CLAMP(GET(a) << GET(b))
  end
  def NOT(a)
    CLAMP(~GET(a))
  end
end

class Circuit
  include OPS

  def reset
    @memo = {}
  end

  def initialize
    reset
  end
end


ops = [
  [/^(\w+)$/, "GET"],
  [/^NOT (\w+)$/, "NOT"],
  [/^(\w+) AND (\w+)$/, "AND"],
  [/^(\w+) OR (\w+)$/, "OR"],
  [/^(\w+) RSHIFT (\w+)$/, "RSHIFT"],
  [/^(\w+) LSHIFT (\w+)$/, "LSHIFT"],
]

c = Circuit.new

(class << c; self; end).class_eval do
  ARGF.each_line do |l|
    i,o = l.strip.split(" -> ")

    ops.each do |rx, op|
      if m = rx.match(i)
        define_method("get_#{o}") do
          @memo[o] ||= begin
                        res = c.send(op, *m.captures)
                        # puts "#{l.strip.rjust(20, " ")} = #{res}"
                        res
                       end
        end
        break
      end
    end
  end
end


# part 1
puts $res = c.get_a

# part 2
def c.get_b;
  $res
end
c.reset

puts c.get_a

