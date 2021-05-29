class TiledMap
  attr_reader :map_data

  def initialize(args, file_path)
    @previous_states = []
    @map_data = args.gtk.parse_json_file(file_path)
    args.state.entities = create_entities
  end

  def tick(args)
    args.state.entities.each { |e| e.tick(args) }
  end

  def create_entities
    entities = []

    # Subtract by vertical max to translate to bottom-left alignment in DR
    vertical_max = map_data["height"] * map_data["tileheight"]
    
    map_data["layers"].last["objects"].each do |ent|
      case ent["name"]
      when "player"
        entities << Player.new(ent["id"], ent["x"], vertical_max - ent["y"])
      when "wall"
        entities << Wall.new(ent["id"], ent["x"], vertical_max - ent["y"])
      when "box"
        entities << Box.new(ent["id"], ent["x"], vertical_max - ent["y"])
      when "dest"
        entities << Dest.new(ent["id"], ent["x"], vertical_max - ent["y"])
      end
    end

    entities
  end
end
