#!/usr/bin/env ruby

class Lights
	def initialize(h,w)
		@a = Array.new(h) { Array.new(w) { 0 } }
	end

	def turn_on(*args)
		brightness(1, *args)
	end

	def turn_off(*args)
		brightness(-1, *args)
	end

	def toggle(*args)
		brightness(2, *args)
	end

	def brightness(brightness, x1,y1,x2,y2)
		(x1..x2).each do |x|
			(y1..y2).each do |y|
				n = @a[x][y] + brightness
				n = [0,n].max
				@a[x][y] = n
			end
		end
	end

	def howmany
		@a.inject(0) { |s,l| s + l.inject(0, &:+) }
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

