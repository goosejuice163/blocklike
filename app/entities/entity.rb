class Entity
  attr_accessor :id, :xx, :yy, :cx, :cy, :side, :args

  def initialize(id, xx = 0, yy = 0)
    @id = id
    @side = 64
    set_coords_from_px(xx, yy)
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

  def set_coords_from_px(xx, yy)
    @xx = xx
    @yy = yy
    @cx = (xx / side).to_i
    @cy = (yy / side).to_i
  end
end

