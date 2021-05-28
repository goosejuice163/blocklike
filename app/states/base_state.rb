class BaseState
  attr_reader :args

  def initialize
    @created = false
  end

  def create
    return if @created
    on_create
    @created = true
  end

  def on_create
  end

  def tick(args)
    @args = args
    create
  end
end
