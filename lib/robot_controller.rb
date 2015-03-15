require_relative 'robot'

class RobotController
  attr_reader :robot

  def initialize
    @robot = Robot.new
  end

  def get_command
    puts "Type a command:"
    command = STDIN.gets
    while command
      self.execute_command(command)
      puts "Type another command:"
      command = STDIN.gets
    end
  end

  def execute_command(command)
    command_word = command.split[0]
    command_arguments = command.split[1]

    case command_word
    when 'PLACE'
      @robot.place command_arguments
    when 'MOVE'
      @robot.move_forward
    when 'LEFT'
      @robot.turn :left
    when 'RIGHT'
      @robot.turn :right
    when 'REPORT'
      puts "#{@robot.show_report}"
    end
  end
end
