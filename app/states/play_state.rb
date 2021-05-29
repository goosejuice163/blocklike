class PlayState < BaseState
  def on_create
    @level = TiledMap.new(args, "assets/data/level_one.json")
    @transaction_engine = TransactionEngine.new(args)
  end

  def tick(args)
    super(args)
    @level.tick(args)
    @transaction_engine.tick(args)
  end
end
