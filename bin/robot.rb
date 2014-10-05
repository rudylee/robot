#!/usr/bin/env ruby

$:.unshift File.expand_path("../../lib", __FILE__)

require "command.rb"

command = Command.new(ARGV, 5, 5)
command.start
