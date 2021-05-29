class Player < Entity
  def update
    update_state
    move
  end

  def update_state
    entity_data = args.state.board_state[id]
    set_coords(entity_data[:cx], entity_data[:cy])
  end

  # Push an action to the root reducer
  def move
    dir = Point.new(0, 0)

    if args.inputs.keyboard.key_down.up
      dir.y = 1
    elsif args.inputs.keyboard.key_down.down
      dir.y = -1
    elsif args.inputs.keyboard.key_down.left
      dir.x = -1
    elsif args.inputs.keyboard.key_down.right
      dir.x = 1
    end

    unless dir.x == 0 && dir.y == 0
      args.state.dispatch.({
        type: :move,
        payload: {
          entity_id: id,
          cx: cx + dir.x,
          cy: cy + dir.y,
        }
      })
    end
  end

  def render
    args.outputs.sprites << {
      x: xx,
      y: yy,
      w: side,
      h: side,
      path: "assets/img/player_05.png"
    }
  end
end
