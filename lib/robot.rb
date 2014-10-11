class Robot
  attr_reader :on_table, :x, :y, :facing

  def initialize
    @on_table = false
  end

  # Put robot on the table 
  def put(x, y, facing)
    @x = x
    @y = y
    @on_table = true
    @facing = get_direction(facing)
  end

  # Rotate directions array based on direction parameter
  def rotate(direction)
    rotation = 1
    if direction == :LEFT 
      rotation = -1
    end
    @facing = get_direction(facing, rotation)
  end

  # Return next position of robot if it moves
  def next_pos
    pos = { :x => @x, :y => @y } 

    case @facing
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

  # Move the robot according to hash position parameter
  def move(pos)
    @x = pos[:x]
    @y = pos[:y]
  end

  # Output the last position of the robot
  def report
    @x.to_s << ',' << @y.to_s << ',' << @facing.to_s
  end

  private 
  def get_direction(facing, rotation = 0)
    directions = [:NORTH, :EAST, :SOUTH, :WEST]

    # Get the index of the facing direction
    index = directions.index(facing)

    # Rotate directions hash twice 
    directions.rotate(index).rotate(rotation).first
  end
end
