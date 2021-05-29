class Box < Entity
  def update
  end

  def render
    args.outputs.sprites << {
      x: xx,
      y: yy,
      w: side,
      h: side,
      path: "assets/img/crate_03.png"
    }
  end
end
