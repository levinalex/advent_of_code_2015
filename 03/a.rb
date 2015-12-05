#!/usr/bin/env ruby


class World
  Directions = {
    "^" => [0,1],
    "v" => [0,-1],
    ">" => [1,0],
    "<" => [-1,0]
  }

  def initialize
    @visits = Hash.new { |h,k| h[k] = 0 }
    @position = [0,0]
  end

  def move(dir)
    @visits[@position] += 1

    delta = Directions[dir]
    @position[0] += delta[0]
    @position[1] += delta[1]
    nil
  end

  def visited_houses
    @visits.keys.length
  end
end

world = World.new

ARGF.read.strip.split(//).each do |c|
  world.move(c)
end

puts world.visited_houses


