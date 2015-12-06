#!/usr/bin/env ruby

class Lights
	def initialize(h,w)
		@a = Array.new(h) { Array.new(w) { false } }
	end

	def turn_on(*args)
		set(true, *args)
	end

	def turn_off(*args)
		set(false, *args)
	end

	def toggle(*args)
		set(nil, *args)
	end

	def set(state, x1,y1,x2,y2)
		(x1..x2).each do |x|
			(y1..y2).each do |y|
				if state.nil?
					n = !@a[x][y]
				else
					n = state
				end
				@a[x][y] = n
			end
		end
	end

	def howmany
		@a.inject(0) { |s,l| l.count { |e| e } + s }
	end
end

size = ARGV.shift.to_i
rx = /(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/
lights = Lights.new(size,size)

input = ARGF.each_line do |l|
	res = rx.match(l)
	_, action, x1, y1, x2, y2 = *res

	lights.send(action.gsub(" ","_"), *[x1,y1,x2,y2].map(&:to_i))
end

puts lights.howmany

