class TransactionEngine
  def initialize(args)
    @previous_states = []
    @board_state = create_initial_board_state(args.state.entities)

    args.state.dispatch = ->(action) {
      new_state = Reducer.reduce(@board_state.dup, action)
      return if new_state.to_s == @board_state.to_s

      @previous_states << @board_state.dup
      @board_state = new_state
    }
  end

  def tick(args)
    args.state.board_state = @board_state

    if args.inputs.keyboard.key_down.z
      return if @previous_states.empty?
      @board_state = @previous_states.pop
    end
  end

  # Serializable representation of game state
  def create_initial_board_state(entities)
    entities.each_with_object({}) do |ent, hsh|
      hsh[ent.id] = ent.serialize
    end
  end
end
