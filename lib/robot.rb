require_relative 'table'

class Robot
  attr_reader :placed, :x_position, :y_position, :orientation

  ORIENTATIONS = [:north, :east, :south, :west]

  def initialize
    @table = Table.new
    @placed = true
    @x_position = 0
    @y_position = 0
    @orientation = :north
  end

  def place(command_arguments)
    position = command_arguments.split ','
    if position.count == 3
      if position[0] =~ /^\d+$/ and position[1] =~ /^\d+$/
        if @table.on_surface?(position[0].to_i, position[1].to_i)
          @x_position = position[0].to_i
          @y_position = position[1].to_i
          if ORIENTATIONS.include?(position[2].downcase.to_sym)
            @orientation = position[2].downcase.to_sym
            @placed = true
          end
        end
      end
    end
  end

  def move_forward
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

  def turn(direction)
    case direction
    when :left
      @orientation = ORIENTATIONS[ORIENTATIONS.index(@orientation) - 1]
    when :right
      @orientation = ORIENTATIONS[ORIENTATIONS.index(@orientation) - (
        ORIENTATIONS.count - 1)]
    end
  end

  def show_report
    "#{@x_position},#{@y_position},#{@orientation.upcase}"
  end
end
