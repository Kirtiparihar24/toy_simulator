require './game'

describe Game do

  before(:each) do
    @game = Game.new
  end

  it 'should return error message' do
    @game.execute("PLACE 0, 0, 0, NORTH")
    expect(@game.generate_report).to eql("Invalid commands")
  end

  it 'Move straight towards North' do
    @game.execute("PLACE 0, 0, NORTH")
    @game.execute("Move")
    @game.execute("Move")
    expect(@game.generate_report).to eql("0,2,north")
  end

  it 'Move straight towards South' do
    @game.execute("PLACE 0, 0, South")
    @game.execute("Move")
    @game.execute("Move")
    @game.execute("Move")
    expect(@game.generate_report).to eql("0,3,south")
  end

  it 'Rotate 90 degree on its right' do
    @game.execute("PLACE 1, 2, EAST")
    @game.execute("RIGHT")
    expect(@game.generate_report).to eql("1,2,south")
  end
end