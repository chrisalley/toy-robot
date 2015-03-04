require 'robot'

RSpec.describe Robot do
  describe "methods" do
    describe "#place" do
      before do
        @robot = Robot.new
      end

      context "the placement position is valid" do
        it "places the robot on the table" do
          @robot.place 0, 0, :north
          expect(@robot.placed).to be true
        end
      end

      context "orientation is not north, south, east, or west" do
        it "does not place the robot on the table" do
          @robot.place 0, 0, :north_west
          expect(@robot.placed).to be false
        end
      end

      context "x position is outside of the table surface" do
        it "does not place the robot on the table" do
          @robot.place 5, 0, :north
          expect(@robot.placed).to be false
        end
      end

      context "y position is outside of the table surface" do
        it "does not place the robot on the table" do
          @robot.place 0, 5, :north
          expect(@robot.placed).to be false
        end
      end
    end

    describe "#move_forward" do
      before do
        @robot = Robot.new
      end

      context "the robot's orientation is north" do
        it "moves the robot north one space" do
          @robot.place 0, 0, :north
          @robot.move_forward
          expect(@robot.y_position).to eq 1
        end
      end

      context "the robot's orientation is east" do
        it "moves the robot east one space" do
          @robot.place 0, 0, :east
          @robot.move_forward
          expect(@robot.x_position).to eq 1
        end
      end

      context "the robot's orientation is south" do
        it "moves the robot south one space" do
          @robot.place 1, 1, :south
          @robot.move_forward
          expect(@robot.y_position).to eq 0
        end
      end

      context "the robot's orientation is west" do
        it "moves the robot west one space" do
          @robot.place 1, 1, :west
          @robot.move_forward
          expect(@robot.x_position).to eq 0
        end
      end

      context "orientation is not north, south, east, or west" do
        it "does not move the robot horizontally" do
          @robot.place 0, 0, :foobar
          @robot.move_forward
          expect(@robot.x_position).to be 0
        end

        it "does not move the robot vertically" do
          @robot.place 0, 0, :foobar
          @robot.move_forward
          expect(@robot.y_position).to be 0
        end
      end

      context "intended x position is outside of the table surface" do
        it "does not move the robot horizontally" do
          @robot.place 4, 0, :east
          @robot.move_forward
          expect(@robot.x_position).to be 4
        end
      end

      context "intended y position is outside of the table surface" do
        it "does not move the robot vertically" do
          @robot.place 0, 4, :north
          @robot.move_forward
          expect(@robot.y_position).to be 4
        end
      end
    end

    describe "#turn" do
      before do
        @robot = Robot.new
      end

      context "robot is facing north" do
        before do
          @robot.place 0, 0, :north
        end

        context "specified direction is left" do
          it "turns the robot to face the west" do
            @robot.turn :left
            expect(@robot.orientation).to eq :west
          end
        end

        context "specified direction is right" do
          it "turns the robot to face the east" do
            @robot.turn :right
            expect(@robot.orientation).to eq :east
          end
        end
      end

      context "robot is facing east" do
        before do
          @robot.place 0, 0, :east
        end

        context "specified direction is left" do
          it "turns the robot to face the north" do
            @robot.turn :left
            expect(@robot.orientation).to eq :north
          end
        end

        context "specified direction is right" do
          it "turns the robot to face the south" do
            @robot.turn :right
            expect(@robot.orientation).to eq :south
          end
        end
      end

      context "robot is facing south" do
        before do
          @robot.place 0, 0, :south
        end

        context "specified direction is left" do
          it "turns the robot to face the east" do
            @robot.turn :left
            expect(@robot.orientation).to eq :east
          end
        end

        context "specified direction is right" do
          it "turns the robot to face the west" do
            @robot.turn :right
            expect(@robot.orientation).to eq :west
          end
        end
      end

      context "robot is facing west" do
        before do
          @robot.place 0, 0, :west
        end

        context "specified direction is left" do
          it "turns the robot to face the south" do
            @robot.turn :left
            expect(@robot.orientation).to eq :south
          end
        end

        context "specified direction is right" do
          it "turns the robot to face the north" do
            @robot.turn :right
            expect(@robot.orientation).to eq :north
          end
        end
      end
    end

    describe "#show_report" do
      before do
        @robot = Robot.new
      end

      context "robot is already placed" do
        it "displays the robot's position" do
          @robot.place 0, 0, :north
          expect(@robot.show_report).to eq "0,0,NORTH"
        end
      end

      context "robot is not yet placed" do
        it "does not display the robot's position" do
          expect(@robot.show_report).not_to eq "nil,nil,nil"
        end
      end
    end
  end
end