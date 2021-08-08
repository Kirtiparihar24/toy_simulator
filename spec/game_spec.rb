require './game'

describe Game do

  before(:each) do
    @game = Game.new
  end

  it 'should return error message' do
    @game.execute("place 0, 0, 0, north")
    expect(@game.generate_report).to eql("Invalid commands")
  end

  it 'Move straight towards North' do
    @game.execute("place 0, 0, north")
    2.times { @game.execute("move") }
    expect(@game.generate_report).to eql("0,2,north")
  end

  it 'Move straight towards South' do
    @game.execute("place 0, 0, south")
    3.times { @game.execute("move") }
    expect(@game.generate_report).to eql("0,3,south")
  end

  it 'Rotate 90 degree on its right' do
    @game.execute("place 1, 2, east")
    @game.execute("right")
    expect(@game.generate_report).to eql("1,2,south")
  end

  it 'Rotate 360 degree' do
    @game.execute("place 2, 2, west")
    4.times { @game.execute("left") }
    expect(@game.generate_report).to eql("2,2,west")
  end

  it 'avoid falling down from 5x5 square table' do
    @game.execute("place 1, 2, west")
    5.times { @game.execute("move") }
    expect(@game.generate_report).to eql("5,2,west")
  end
end