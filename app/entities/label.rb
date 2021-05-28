class Label
  attr_accessor :x, :y, :text, :size_enum, :font

  def initialize(x, y, text, size_enum)
    @x = x
    @y = y
    @text = text
    @size_enum = size_enum
    @font = "assets/fonts/cardenio_modern.otf"
  end

  def tick(args)
    @args = args
    @args.outputs.labels << primitive
  end

  def primitive
    { x: x, y: y, text: text, size_enum: size_enum, font: font }
  end

  def center
    @x = @args.grid.w / 2 - width / 2
    @y = @args.grid.h / 2 + height / 2
  end

  def box
    @box ||= @args.gtk.calcstringbox(text, size_enum, font)
  end

  def width
    box[0]
  end

  def height
    box[1]
  end
end
