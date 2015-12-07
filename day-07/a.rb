module OPS
  def GET(x)
    if x =~ /\d+/
      x.to_i
    else
      send("get_#{x}")
    end
  end

  def AND(a, b)
    GET(a) & GET(b)
  end

  def OR(a, b)
    GET(a) | GET(b)
  end

  def RSHIFT(a, b)
    GET(a) >> GET(b)
  end

  def LSHIFT(a, b)
    GET(a) << GET(b)
  end

  def NOT(a)
    ~GET(a)
  end
end

class Circuit
  include OPS
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
  memo = {}

  ARGF.each_line do |l|
    i,o = l.strip.split(" -> ")
    cmd = i.split(/\s+/)

    ops.each do |rx, op|
      if m = rx.match(i)
        define_method("get_#{o}") do
         memo[o] ||= begin
                        res = c.send(op, *m.captures)
                        puts "#{l.strip}: \t #  #{res}"
                        res
                      end
        end
      end
    end
  end
end

puts c.get_a

