class Wall < Entity
  def update
  end

  def render
    args.outputs.sprites << {
      x: xx,
      y: yy,
      w: side,
      h: side,
      path: "assets/img/block_03.png"
    }
  end
end