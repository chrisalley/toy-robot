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
      output = self.execute_command(command)
      puts "#{output}\n"
      puts "Type another command:"
      command = STDIN.gets
    end
  end

  def execute_command(command)
    command_word = command.split[0]
    command_arguments = command.split[1]

    case command_word
    when 'PLACE'
      output = place_robot(command_arguments)
    when 'MOVE'
      output = @robot.move_forward
    when 'LEFT'
      output = @robot.turn :left
    when 'RIGHT'
      output = @robot.turn :right
    when 'REPORT'
      output = @robot.show_report
    else
      output = "Ignoring invalid command."
    end
    output
  end

  def place_robot(command_arguments)
    if command_arguments
      args = command_arguments.split ','
      if args.count == 3
        if args[0] =~ /^\d+$/ and args[1] =~ /^\d+$/
          output = @robot.place(args[0].to_i, args[1].to_i,
            args[2].downcase.to_sym)
        else
          output = "X and Y coordinates must be integers."
        end
      else
        output = "Wrong number of placement argumnets."
      end
    else
      output = "Must specify at least one argument with PLACE command."
    end
    output
  end
end
