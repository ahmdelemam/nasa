class Map < Struct.new(:width, :height); end;

class Rover
  HEADINGS = ['N', 'E', 'S', 'W'].freeze

  attr_accessor :x, :y, :heading

  def initialize(x, y, heading)
    @x, @y, @heading = x, y, HEADINGS.find_index(heading)
  end

  def move
    case @heading
    when 0 then @y += 1 # Move to North
    when 1 then @x += 1 # Move to East
    when 2 then @y -= 1 # Move to South
    when 3 then @x -= 1 # Move to West
    end
  end

  def rotate(counterclockwise = false)
    if counterclockwise
      @heading == 0 ? @heading = 3 : @heading -= 1
    else
      @heading == 3 ? @heading = 0 : @heading += 1
    end
  end

  def position
    [ @x, @y, Rover::HEADINGS[@heading] ]
  end
  
  def in_map?(width, height)
    @x.between?(0, width) && @y.between?(0, height)
  end
end