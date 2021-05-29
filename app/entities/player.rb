class Player < Entity
  def update
    move
  end

  def move
    if args.inputs.keyboard.key_down.up
      set_coords(cx, cy + 1)
    elsif args.inputs.keyboard.key_down.down
      set_coords(cx, cy - 1)
    elsif args.inputs.keyboard.key_down.left
      set_coords(cx - 1, cy)
    elsif args.inputs.keyboard.key_down.right
      set_coords(cx + 1, cy)
    end
  end

  def render
    @args.outputs.sprites << {
      x: xx,
      y: yy,
      w: side,
      h: side,
      path: "assets/img/player_05.png"
    }
  end
end
