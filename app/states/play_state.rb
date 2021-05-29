class PlayState < BaseState
  def on_create
    @player = Player.new
  end

  def tick(args)
    super(args)
    @player.tick(args)
  end
end
