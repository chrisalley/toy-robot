require 'table'

RSpec.describe Table do
  describe "methods" do
    describe "#on_surface?" do
      before do
        @table = Table.new
      end

      context "specified x position is equal to the lowest x coordinate" do
        it "returns true" do
          expect(@table.on_surface?(@table.lowest_x_coordinate, 0))
            .to be true
        end
      end

      context "specified x position is less than the lowest x coordinate" do
        it "returns false" do
          expect(@table.on_surface?(@table.lowest_x_coordinate - 1, 0))
            .to be false
        end
      end

      context "specified y position is equal to the lowest y coordinate" do
        it "returns true" do
          expect(@table.on_surface?(0, @table.lowest_y_coordinate))
            .to be true
        end
      end

      context "specified y position is less than the lowest y coordinate" do
        it "returns false" do
          expect(@table.on_surface?(0, @table.lowest_y_coordinate - 1))
            .to be false
        end
      end

      context "specified x position is equal to the highest x coordinate" do
        it "returns true" do
          expect(@table.on_surface?(@table.highest_x_coordinate, 0))
            .to be true
        end
      end

      context "specified x position is greater than the highest x coordinate" do
        it "returns false" do
          expect(@table.on_surface?(@table.highest_x_coordinate + 1, 0))
            .to be false
        end
      end

      context "specified y position is equal to the highest y coordinate" do
        it "returns true" do
          expect(@table.on_surface?(0, @table.highest_y_coordinate))
            .to be true
        end
      end

      context "specified y position is greater than the highest y coordinate" do
        it "returns false" do
          expect(@table.on_surface?(0, @table.highest_y_coordinate + 1))
            .to be false
        end
      end
    end
  end
end
