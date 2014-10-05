#!/usr/bin/env ruby

require "../lib/robot.rb"
require "../lib/table.rb"

filename = ARGV.first

file = File.open(filename, "r")
file.each_line do |line|
  puts line
end
file.close

table = Table.new(5,5)
robot = Robot.new(1,1,"SOUTH")

