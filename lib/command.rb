require 'robot.rb'
require 'table.rb'

class Command
  def initialize(filename, table_width, table_height)
    if ARGV.empty?
      abort "Please provide command file"
    end

    @file = open_file(ARGV.first)
    @table = Table.new(table_width, table_height)
    @robot = Robot.new
  end

  def start
    @file.each_line do |line|
      command = line.split(" ")

      # Ignore the command if robot is not on the table
      if !@robot.on_table and command[0] != "PLACE" then next end

      case command[0]
      when "PLACE"
        place(command[1])
      when "LEFT"
        @robot.rotate(:LEFT)
      when "RIGHT"
        @robot.rotate(:RIGHT)
      when "MOVE"
        next_pos = @robot.next_pos
        if @table.valid_pos?(next_pos) then @robot.move(next_pos) end
      when "REPORT"
        puts @robot.report
      end
    end
    @file.close
  end

  # Open the command file and abort if file is not exist
  def open_file(filename)
    unless File.file?(filename) 
      abort "File does not exist"
    end

    File.open(filename, "r")
  end

  # Place robot the table
  def place(options)
    pos = options.split(",")
    x = pos[0].to_i
    y = pos[1].to_i
    f = pos[2].to_sym

    if @table.valid_pos?({:x => x, :y => y}) 
      @robot.put(pos[0].to_i,pos[1].to_i, pos[2].to_sym)
    end
  end
end
