class Robot
  def initialize(x, y, f)
    @x = x
    @y = y
    @f = f
  end

  def move

  end

  def report
    puts @x.to_s << ' ' << @y.to_s << ' ' << @f.to_s
  end
end
