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
        output = "The robot was successfully placed on the table."
      else
        output = "The robot must be facing a valid direction."
      end
    else
      output = "The robot must be placed within the dimensions of the table."
    end
    output
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
      else
        output = "Invalid orientation."
      end

      if @table.on_surface?(intended_x_position, intended_y_position)
        @x_position = intended_x_position
        @y_position = intended_y_position
        output = "The robot moved #{@orientation}."
      else
        output = "The robot cannot be moved off the table surface."
      end
    else
      output = "The robot cannot be moved until it is placed."
    end
    output
  end

  def turn(direction)
    if @placed
      case direction
      when :left
        @orientation = ORIENTATIONS[ORIENTATIONS.index(@orientation) - 1]
        output = "The robot turned left and is now facing #{@orientation}."
      when :right
        @orientation = ORIENTATIONS[ORIENTATIONS.index(@orientation) - (
          ORIENTATIONS.count - 1)]
        output = "The robot turned right and is now facing #{@orientation}."
      else
        output = "Invalid turning direction."
      end
    else
      output = "The robot cannot be turned until it is placed."
    end
    output
  end

  def show_report
    if @placed
      output = "#{@x_position},#{@y_position},#{@orientation.upcase}"
    else
      output = "The robot has not been placed on the table yet."
    end
    output
  end
end
