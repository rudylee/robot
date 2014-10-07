class Robot
  attr_reader :on_table, :x, :y, :directions

  def initialize
    @directions = [:NORTH, :EAST, :SOUTH, :WEST]
    @on_table = false
  end

  def put(x, y, facing)
    @x = x
    @y = y
    @on_table = true
    set_direction(facing)
  end

  # Rotate directions array based on direction
  def rotate(direction)
    rotation = 1
    if direction == :LEFT 
      rotation = -1
    end
    @directions = @directions.rotate(rotation)
  end

  # Return next position of robot if it moves
  def next_pos
    pos = { :x => @x, :y => @y } 

    case @directions.first
    when :NORTH
      pos[:y] = @y + 1
    when :SOUTH
      pos[:y] = @y - 1
    when :EAST
      pos[:x] = @x + 1
    else
      pos[:x] = @x - 1
    end

    pos
  end

  # Move the robot according to hash position
  def move(pos)
    @x = pos[:x]
    @y = pos[:y]
  end

  # Output the last position of the robot
  def report
    @x.to_s << ',' << @y.to_s << ',' << @directions.first.to_s
  end

  private

  # Initialize facing direction
  def set_direction(direction)
    index = @directions.index(direction)
    @directions = @directions.rotate(index)
  end
end
