#!/usr/bin/env ruby


class World
  Directions = {
    "^" => [0,1],
    "v" => [0,-1],
    ">" => [1,0],
    "<" => [-1,0],
    "." => [0,0],
  }

  def initialize
    @visits = Hash.new { |h,k| h[k] = 0 }
    @playerpositions = Hash.new { |h,k| h[k] = [0,0] }
  end

  def move(player, dir)
    pos = @playerpositions[player]

    delta = Directions[dir]
    pos[0] += delta[0]
    pos[1] += delta[1]

    @visits[pos.join(",")] += 1
    @playerpositions[player] = pos
    nil
  end

  def visited_houses
    @visits.keys.length
  end
end

world = World.new
players = [1,2]
moves = players.cycle

players.each do |p| world.move(p, ".") end

ARGF.read.strip.split(//).each do |c|
  player = moves.next
  world.move(player, c)
end

puts world.visited_houses


