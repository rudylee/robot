#!/usr/bin/env ruby

require "../lib/robot.rb"
require "../lib/table.rb"

table = Table.new(5,5)
robot = Robot.new(1,1,"S")

robot.report
