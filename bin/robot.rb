#!/usr/bin/env ruby

$:.unshift File.expand_path("../../lib", __FILE__)

require "robot.rb"
require "table.rb"

table = Table.new(5,5)
robot = Robot.new

filename = ARGV.first 

unless File.file?(filename) 
  abort "Please provide command file"
end

file = File.open(filename, "r")
file.each_line do |line|
  command = line.split(" ")

  # Ignore the command if robot is not on the table
  if !robot.on_table and command[0] != "PLACE" then next end

  case command[0]
  when "PLACE"
    pos = command[1].split(",")
    robot.put(pos[0].to_i,pos[1].to_i, pos[2].to_sym)
  when "LEFT"
    robot.rotate(:LEFT)
  when "RIGHT"
    robot.rotate(:RIGHT)
  when "MOVE"
    next_pos = robot.next_pos
    if table.valid_pos?(next_pos) then robot.move(next_pos) end
  when "REPORT"
    robot.report
  end
end
file.close

