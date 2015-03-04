#!/usr/bin/env ruby

puts "Welcome to the Toy Robot Simulator."

require_relative 'lib/robot_controller'
robot_controller = RobotController.new
robot_controller.get_command
