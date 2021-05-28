class PlayState < BaseState
  def tick(args)
    super(args)
    args.outputs.labels << [580, 400, 'play state']
  end
end
