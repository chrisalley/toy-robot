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
      place_robot(command_arguments)
    when 'MOVE'
      @robot.move_forward
    when 'LEFT'
      @robot.turn :left
    when 'RIGHT'
      @robot.turn :right
    when 'REPORT'
      puts "#{@robot.show_report}\n"
    end
  end

  def place_robot(command_arguments)
    if command_arguments
      args = command_arguments.split ','
      if args.count == 3
        if args[0] =~ /^\d+$/ and args[1] =~ /^\d+$/
          @robot.place(args[0].to_i, args[1].to_i, args[2].downcase.to_sym)
          true if @robot.placed
        end
      end
    end
  end
end
