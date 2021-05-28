require 'app/state_machine.rb'
require 'app/states/menu_state.rb'

class Game
  attr_accessor :args, :gtk, :state, :inputs, :outputs, :grid

  def init
    state.state_machine ||= StateMachine.new({
      menu: MenuState.new
    }, :menu)
  end

  def tick
    init
    state.state_machine.tick(args)
  end
end

$game = Game.new

def tick args
  $game.args = args
  $game.gtk = args.gtk # gtk.parse_json/parse_json_file
  $game.state = args.state
  $game.inputs = args.inputs
  $game.outputs = args.outputs
  $game.grid = args.grid
  $game.tick
end

