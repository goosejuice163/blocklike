class PlayState < BaseState
  def on_create
    # @player = Player.new
    @level = TiledMap.new(args, "assets/data/level_one.json")
  end

  def tick(args)
    super(args)
    @level.tick(args)
    # @player.tick(args)
  end
end
