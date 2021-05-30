class TiledMap
  attr_reader :map_data

  def initialize(args, file_path)
    @previous_states = []
    @map_data = args.gtk.parse_json_file(file_path)
    args.state.entities = create_entities
  end

  def tick(args)
    args.state.entities.each { |e| e.tick(args) }
    # render_background(args)
  end

  def render_background(args)
    return if @rendered

    background_layer["data"].each_with_index do |tile, i|
      tile_x = i * 64 % 9
      tile_y = vertical_offset - (i / 9 * 64)
      args.outputs.static_sprites << { x: tile_x, y: tile_y, path: 'assets/img/sokoban_tilesheet.png', tile_x: 0, tile_y: 0, tile_w: 64, tile_h: 64 }
    end

    @rendered = true
  end

  def create_entities
    entities = []

    entities_layer["objects"].each do |ent|
      case ent["name"]
      when "player"
        entities << Player.new(ent["id"], ent["x"], vertical_offset - ent["y"])
      when "wall"
        entities << Wall.new(ent["id"], ent["x"], vertical_offset - ent["y"])
      when "box"
        entities << Box.new(ent["id"], ent["x"], vertical_offset - ent["y"])
      when "dest"
        entities << Dest.new(ent["id"], ent["x"], vertical_offset - ent["y"])
      end
    end

    entities
  end

  def background_layer
    map_data["layers"].find { |l| l["name"] == "background" }
  end

  def entities_layer
    map_data["layers"].find { |l| l["name"] == "entities" }
  end

  # Offset to translate to DR's bottom-left rendering.
  # Don't need to recompute unless map w/h changes.
  def vertical_offset
    @vertical_offset ||= map_data["height"] * map_data["tileheight"]
  end
end
