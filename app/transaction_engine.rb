class TransactionEngine
  def initialize(args)
    @previous_states = []
    @board_state = create_initial_board_state(args.state.entities)

    args.state.dispatch = ->(action) {
      new_state = reduce(@board_state, action)
      @previous_states << @board_state.dup
      @board_state = new_state
    }
  end

  def tick(args)
    args.state.board_state = @board_state
  end

  # Serializable representation of game state
  def create_initial_board_state(entities)
    entities.each_with_object({}) do |ent, hsh|
      hsh[ent.id] = {
        cx: ent.cx,
        cy: ent.cy
      }
    end
  end

  def reduce(state, action)
    payload = action[:payload]

    case action[:type]
    when :move
      handle_move(state, payload)
    else
      state
    end
  end

  def handle_move(state, payload)
    {
      **state,
      payload[:entity_id] => {
        cx: payload[:cx],
        cy: payload[:cy]
      }
    }
  end
end
