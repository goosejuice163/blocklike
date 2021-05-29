class Reducer
  # Perhaps compose reducers from different entities?
  def self.reduce(state, action)
    payload = action[:payload]

    case action[:type]
    when :move
      handle_move(state, payload)
    else
      state
    end
  end

  def self.handle_move(state, payload)
    {
      **state,
      payload[:entity_id] => {
        cx: payload[:cx],
        cy: payload[:cy]
      }
    }
  end
end
