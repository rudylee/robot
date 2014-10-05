class Table
  attr_accessor :width, :height 

  def initialize(width, height)
    @width = width
    @height = height
  end

  def valid_pos?(pos)
    if pos[:x] < 0 or pos[:y] < 0 or pos[:x] > @width or pos[:y] > @height
      return false
    end
    true
  end
end
