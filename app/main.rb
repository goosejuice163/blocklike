# Core
require 'app/point.rb'
require 'app/tiled_map.rb'
require 'app/reducer.rb'
require 'app/transaction_engine.rb'
require 'app/state_machine.rb'
require 'app/states/base_state.rb'

# Entities
require 'app/entities/entity.rb'
require 'app/entities/player.rb'
require 'app/entities/label.rb'

# States
require 'app/states/menu_state.rb'
require 'app/states/play_state.rb'

class Game
  attr_accessor :args

  def initialize
    @created = false
  end

  def init
    return if @created

    args.state.state_machine = StateMachine.new({
      menu: MenuState.new,
      play: PlayState.new
    }, :menu)

    @created = true
  end

  def tick
    init
    args.state.state_machine.tick(args)
  end
end

$game = Game.new

def tick args
  $game.args = args
  $game.tick
end

