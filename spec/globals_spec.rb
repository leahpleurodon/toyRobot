require './lib/robot'
require './lib/globals'

describe 'Globals' do
  context 'when used directly' do
    it 'should cycle through an array' do
       expect($faces[cycle($faces ,1 ,'NORTH')]).to eq('EAST')
    end
  end
end
