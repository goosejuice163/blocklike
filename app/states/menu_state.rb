class MenuState < BaseState
  def on_create
    @title = Label.new(0, 0, 'blocklike', 32)
    @start = Label.new(0, 0, 'press ENTER', 12) 
  end

  def tick(args)
    super(args)

    @title.tick(args)
    @title.center

    @start.tick(args)
    @start.center
    @start.y -= @title.height

    if args.inputs.keyboard.key_down.enter
      args.state.state_machine.change(:play)
    end
  end
end
