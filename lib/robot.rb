require_relative 'table'

class Robot
  attr_reader :placed, :x_position, :y_position, :orientation

  ORIENTATIONS = [:north, :east, :south, :west]

  def initialize
    @table = Table.new
    @placed = false
    @x_position = nil
    @y_position = nil
    @orientation = nil
  end

  def place(intended_x_position, intended_y_position, intended_orientation)
    if @table.on_surface?(intended_x_position, intended_y_position)
      @x_position = intended_x_position
      @y_position = intended_y_position
      if ORIENTATIONS.include?(intended_orientation)
        @orientation = intended_orientation
        @placed = true
      end
    end
  end

  def move_forward
    if @placed
      intended_x_position = @x_position
      intended_y_position = @y_position

      case @orientation
      when :north
        intended_y_position = @y_position + 1
      when :south
        intended_y_position = @y_position - 1
      when :east
        intended_x_position = @x_position + 1
      when :west
        intended_x_position = @x_position - 1
      end

      if @table.on_surface?(intended_x_position, intended_y_position)
        @x_position = intended_x_position
        @y_position = intended_y_position
      end
    end
  end

  def turn(direction)
    if @placed
      case direction
      when :left
        @orientation = ORIENTATIONS[ORIENTATIONS.index(@orientation) - 1]
      when :right
        @orientation = ORIENTATIONS[ORIENTATIONS.index(@orientation) - (
          ORIENTATIONS.count - 1)]
      end
    end
  end

  def show_report
    "#{@x_position},#{@y_position},#{@orientation.upcase}" if @placed
  end
end
