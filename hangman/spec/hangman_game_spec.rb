require 'game'

RSpec.describe "hangman game" do
	let(:board) { double('board') }
	let(:game) { Game.new('test', board) }

	before do
		allow(board).to receive(:draw)
	end

  it "draws a blank board given a word" do
  	expect(board).to receive(:draw).with('____', [])
  	game.start
  end

  it "updates the board on correct guesses" do
  	game.start
  	expect(board).to receive(:draw).with('t__t', [])
  	game.guess('t')
  end

  it "updates the board on repeat correct guesses" do
  	game.start
  	game.guess('t')
  	expect(board).to receive(:draw).with('te_t', [])
  	game.guess('e')
  end

  it "updates the board on incorrect guesses" do
  	game.start
  	expect(board).to receive(:draw).with('____', ['u'])
  	game.guess('u')
	end

  it "updates the board on repeat incorrect guesses" do
  	game.start
  	game.guess('u')
  	expect(board).to receive(:draw).with('____', ['u', 'z'])
  	game.guess('z')
	end
end
