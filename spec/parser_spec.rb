require './lib/robot'
require './lib/parser'


describe 'Parser' do
  context 'when executed from comand line' do
    it 'should read bots Y co-ord at max value allowed' do
      # based on table global variable max = 4
      @robot = Robot.new
      @robot.place(0, 4, 'NORTH')
      expect(checkCoord(@robot.position[:y])).to eq(:atmax)
      expect(checkCoord(@robot.position[:x])).to eq(:atmin)
    end
    it 'should raise an error for non existant command' do
      @robot = Robot.new
      @robot.place(0, 4, 'NORTH')
      expect { execCommand('GLEBEN') }.to raise_error(NoSuchCommand)
    end
    it 'should raise an error for non existant command' do
      @robot = Robot.new
      @robot.place(0, 4, 'NORTH')
      expect { execCommand('GLEBEN') }.to raise_error(NoSuchCommand)
    end
    it 'should raise an error a non integer co-ord' do
      @robot = Robot.new
      expect { parsePlaceCommand('PLACE 0,GLEBEN,NORTH') }.to raise_error(NoSuchCommand)
    end
    it 'should convert string to an array and send array values to command' do
      # based on table global variable max = 4
      @robot = Robot.new
      expect(parsePlaceCommand('PLACE 2,2,NORTH')).to eq ([2, 2, 'NORTH'])
    end
    it 'should run the place command with the correct arguments' do
      # based on table global variable max = 4
      @robot = Robot.new
      execCommand('PLACE 1,2,NORTH')
      expect(@robot.position).to include(
        x: 1,
        y: 2,
        f: 'NORTH'
      )
    end
    it 'should raise an error and not put the bot on the table.' do
      # based on table global variable max = 4
      @robot = Robot.new
      expect { execCommand('PLACE 11,2,NORTH') }.to raise_error(PlaceOffTable)
    end
  end
end
