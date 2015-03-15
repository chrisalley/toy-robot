require 'robot_controller'

RSpec.describe RobotController do
  describe "methods" do
    before do
      @robot_controller = RobotController.new
    end

    describe "#execute_command" do
      context "robot is not yet placed on the table" do
        context "PLACE command is entered followed by the REPORT command" do
          it "reports the robot's position on the table" do
            @robot_controller.execute_command "PLACE 0,0,NORTH"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("0,0,NORTH\n").to_stdout
          end
        end

        context "MOVE command is entered followed by the REPORT command" do
          it "ignores the command" do
            @robot_controller.execute_command "MOVE"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("\n").to_stdout
          end
        end

        context "LEFT command is entered followed by the REPORT command" do
          it "ignores the command" do
            @robot_controller.execute_command "LEFT"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("\n").to_stdout
          end
        end

        context "RIGHT command is entered followed by the REPORT command" do
          it "ignores the command" do
            @robot_controller.execute_command "RIGHT"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("\n").to_stdout
          end
        end
      end

      context "robot is already placed, facing north" do
        before do
          @robot_controller.execute_command "PLACE 0,0,NORTH"
        end

        context "REPORT command is entered" do
          it "reports the current position of the robot" do
            expect { @robot_controller.execute_command("REPORT") }
              .to output("0,0,NORTH\n").to_stdout
          end
        end

        context "PLACE command is entered followed by the REPORT command" do
          it "reports the robot's new position on the table" do
            @robot_controller.execute_command "PLACE 1,0,NORTH"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("1,0,NORTH\n").to_stdout
          end
        end

        context "MOVE command is entered followed by the REPORT command" do
          it "reports that the robot has moved north one place on the table" do
            @robot_controller.execute_command "MOVE"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("0,1,NORTH\n").to_stdout
          end
        end

        context "LEFT command is entered followed by the REPORT command" do
          it "reports that the robot is now facing the west" do
            @robot_controller.execute_command "LEFT"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("0,0,WEST\n").to_stdout
          end
        end

        context "RIGHT command is entered followed by the REPORT command" do
          it "reports that the robot is now facing the east" do
            @robot_controller.execute_command "RIGHT"
            expect { @robot_controller.execute_command("REPORT") }
              .to output("0,0,EAST\n").to_stdout
          end
        end
      end
    end
  end
end
