class Game
  attr_accessor :args, :state, :inputs, :outputs, :grid

  def tick
    args.outputs.labels << [580, 400, 'hello world']
  end
end

$game = Game.new

def tick args
  $game.args = args
  $game.state = args.state
  $game.inputs = args.inputs
  $game.outputs = args.outputs
  $game.grid = args.grid
  $game.tick
end

