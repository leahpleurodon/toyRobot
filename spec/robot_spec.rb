require './lib/robot'

describe Robot do
  context 'when commands are all entered manually and correctly' do
    #set up robot each time.
    before(:each) do
      @robot = Robot.new
      @robot.place(1,2,"NORTH")
    end
    it "should place a robot with the position hash filled out" do
      expect(@robot.position).to include(
      :x => 1,
      :y => 2,
      :f => "NORTH")
    end
    it "should rotate the robot to the right" do
      @robot.right
      expect(@robot.position[:f]).to eq("EAST")
    end
    it "should move the robot in the direction it is facing" do
      @robot.left
      expect(@robot.position[:f]).to eq("WEST")
    end
    it "should move the robot in the direction it is facing" do
      @robot.move
      expect(@robot.position[:x]).to eq(1)
      expect(@robot.position[:y]).to eq(3)
    end
    it "should report the position as a string" do
      expect(@robot.report).to eq("1,2,NORTH")
    end
  end
  context 'when commands are entered manually and could kill the robot or are in the wrong order' do
    it "should not move the bot if the bot will fall of the table" do
      @robot = Robot.new
      @robot.place(0,1,"WEST")
      expect { @robot.move }.to raise_error(EdgeError)
      expect(@robot.position).to include(#check no changes have been made
      :x => 0,
      :y => 1,
      :f => "WEST")
    end
    it "shouldn't allow movement beofre placement" do
      @robot = Robot.new
      expect { @robot.move }.to raise_error(NoPlaceError)
    end

  end
end
