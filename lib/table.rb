class Table
  attr_reader :lowest_x_coordinate, :lowest_y_coordinate
  attr_reader :highest_x_coordinate, :highest_y_coordinate

  def initialize
    @lowest_x_coordinate = 0
    @lowest_y_coordinate = 0
    @highest_x_coordinate = 4
    @highest_y_coordinate = 4
  end

  def on_surface?(x, y)
    (x >= @lowest_x_coordinate and x <= @highest_x_coordinate and
      y >= @lowest_y_coordinate and y <= @highest_y_coordinate)
  end
end
