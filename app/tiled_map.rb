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
end
