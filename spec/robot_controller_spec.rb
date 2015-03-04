require 'robot_controller'

RSpec.describe RobotController do
  describe "methods" do
    before do
      @robot_controller = RobotController.new
    end

    describe "#execute_command" do
      context "robot is not yet placed on the table" do
        context "PLACE command is entered" do
          it "places the robot on the table" do
            @robot_controller.execute_command "PLACE 0,0,NORTH"
            expect(@robot_controller.robot.placed).to be true
          end
        end

        context "MOVE command is entered" do
          it "does not move the robot" do
            @robot_controller.execute_command "MOVE"
            expect(@robot_controller.robot.y_position).to eq nil
          end
        end

        context "LEFT command is entered" do
          it "does not change the robot's orientation" do
            @robot_controller.execute_command "LEFT"
            expect(@robot_controller.robot.orientation).to eq nil
          end
        end

        context "RIGHT command is entered" do
          it "does not change the robot's orientation" do
            @robot_controller.execute_command "RIGHT"
            expect(@robot_controller.robot.orientation).to eq nil
          end
        end

        context "REPORT command is entered" do
          it "does not output the robot's (lack of) position to stdout" do
            expect { @robot_controller.execute_command("REPORT") }
              .not_to output("nil,nil,nil\n").to_stdout
          end
        end
      end

      context "robot is already placed, facing north" do
        before do
          @robot_controller.execute_command "PLACE 0,0,NORTH"
        end

        context "PLACE command is entered" do
          it "places the robot in the new position on the table" do
            @robot_controller.execute_command "PLACE 1,0,NORTH"
            expect(@robot_controller.robot.x_position).to be 1
          end
        end

        context "MOVE command is entered" do
          it "moves the robot north one place on the table" do
            @robot_controller.execute_command "MOVE"
            expect(@robot_controller.robot.y_position).to eq 1
          end
        end

        context "LEFT command is entered" do
          it "turns the robot to the face the west" do
            @robot_controller.execute_command "LEFT"
            expect(@robot_controller.robot.orientation).to eq :west
          end
        end

        context "RIGHT command is entered" do
          it "turns the robot to the face the east" do
            @robot_controller.execute_command "RIGHT"
            expect(@robot_controller.robot.orientation).to eq :east
          end
        end

        context "REPORT command is entered" do
          it "returns the current position of the robot" do
            expect(@robot_controller.execute_command("REPORT"))
              .to eq "0,0,NORTH"
          end
        end
      end

      context "an invalid command is entered" do
        it "returns an error message" do
          expect(@robot_controller.execute_command("FOOBAR"))
            .to eq "Ignoring invalid command."
        end
      end
    end

    describe "#place_robot" do
      context "position string is in the correct format" do
        it "places the robot on the table" do
          @robot_controller.place_robot "0,0,NORTH"
          expect(@robot_controller.robot.placed).to be true
        end
      end

      context "method has no arguments" do
        it "does not place the robot on the table" do
          @robot_controller.place_robot nil
          expect(@robot_controller.robot.placed).to be false
        end
      end

      context "method has less than 3 arguments" do
        it "does not place the robot on the table" do
          @robot_controller.place_robot "0,0"
          expect(@robot_controller.robot.placed).to be false
        end
      end

      context "method has more than 3 arguments" do
        it "does not place the robot on the table" do
          @robot_controller.place_robot "0,0,NORTH,NORTH"
          expect(@robot_controller.robot.placed).to be false
        end
      end

      context "specified x position is not an integer" do
        it "does not place the robot on the table" do
          @robot_controller.place_robot "FOOBAR,0,NORTH"
          expect(@robot_controller.robot.placed).to be false
        end
      end

      context "y position is not an integer" do
        it "specified does not place the robot on the table" do
          @robot_controller.place_robot "0,FOOBAR,NORTH"
          expect(@robot_controller.robot.placed).to be false
        end
      end
    end
  end
end
