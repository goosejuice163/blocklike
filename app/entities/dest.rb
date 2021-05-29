class Dest < Entity
  def update
  end

  def render
    args.outputs.sprites << {
      x: xx,
      y: yy,
      w: side,
      h: side,
      path: "assets/img/environment_04.png"
    }
  end
end
