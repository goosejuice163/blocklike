class StateMachine
  def initialize(states, current)
    @states = states
    @current = states[current]
  end

  def change(next_state)
    @current = @states[next_state]
  end

  def tick(args)
    @current.tick(args)
  end
end
