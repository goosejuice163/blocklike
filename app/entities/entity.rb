class Entity
  attr_accessor :xx, :yy, :cx, :cy, :side, :args

  def initialize(cx = 0, cy = 0)
    @side = 64
    set_coords(cx, cy)
  end

  def tick(args)
    @args = args
    update
    render
  end

  def update
    raise "implemented in subclass"
  end

  def render
    raise "implemented in subclass"
  end

  def set_coords(cx, cy)
    @cx = cx
    @cy = cy
    @xx = (cx * side).to_i
    @yy = (cy * side).to_i
  end
end

