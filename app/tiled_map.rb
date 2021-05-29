class TiledMap
  attr_reader :map_data

  def initialize(args, file_path)
    @previous_states = []
    @map_data = args.gtk.parse_json_file(file_path)
    args.state.entities = create_entities
    @board_state = create_board_state(args.state.entities)

    args.state.dispatch = ->(action) {
      new_state = reduce(@board_state, action)
      @previous_states << @board_state.dup
      @board_state = new_state
    }
  end

  def tick(args)
    args.state.board_state = @board_state
    # Should this even handle this responsibility?
    args.state.entities.each { |e| e.tick(args) }
  end

  def create_entities
    entities = []
    
    map_data["layers"].last["objects"].each do |ent|
      case ent["name"]
      when "player"
        entities << Player.new(ent["id"], ent["x"], 720 - ent["y"])
      when "wall"
      when "box"
      when "dest"
      end
    end

    entities
  end

  # Serializable representation of game state
  def create_board_state(entities)
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
