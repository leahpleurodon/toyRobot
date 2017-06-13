require './lib/robot'
require './lib/globals'

describe "Globals" do
  context 'when used directly via class methods' do
    it "should cycle through an array" do
       expect($faces[cycle($faces,1,"NORTH")]).to eq("EAST")
    end
    it "should read bot's Y co-ord at max value allowed" do
      #based on table global variable max = 4
      @robot = Robot.new
      @robot.place(0,4,"NORTH")
      expect(checkCoord(@robot.position[:y])).to eq(:atmax)
      expect(checkCoord(@robot.position[:x])).to eq(:atmin)
    end
  end
end
