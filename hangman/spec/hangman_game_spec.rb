require 'game'
require 'board'

RSpec.describe "hangman game" do
  let(:board) { Board.new }
  let(:game) { Game.new('test', board) }

  it "draws a blank board given a word" do
    expect(board).to receive(:draw).with('____', [])
    game.start
  end

  before do
    game.start
  end

  it "updates the board on correct guesses" do
    expect(board).to receive(:draw).with('t__t', [])
    game.guess('t')
  end

  it "updates the board on repeat correct guesses" do
    game.guess('t')
    expect(board).to receive(:draw).with('te_t', [])
    game.guess('e')
  end

  it "updates the board on incorrect guesses" do
    expect(board).to receive(:draw).with('____', ['u'])
    game.guess('u')
  end

  it "updates the board on repeat incorrect guesses" do
    game.guess('u')
    expect(board).to receive(:draw).with('____', ['u', 'z'])
    game.guess('z')
  end

  it "updates the board with a mixture of correct and incorrect guesses" do
    game.guess('t')
    game.guess('u')
    game.guess('z')
    expect(board).to receive(:draw).with('te_t', ['u', 'z'])
    game.guess('e')
  end

  it "can determine when a game is won" do
    game.guess('t')
    game.guess('e')
    expect(board).to receive(:game_won)
    game.guess('s')
  end

  it "can determine when a game is lost" do
    game.guess('a')
    game.guess('b')
    game.guess('c')
    game.guess('d')
    game.guess('e')
    game.guess('f')
    game.guess('g')
    game.guess('h')
    game.guess('i')
    expect(board).to receive(:game_lost)
    game.guess('j')
  end

  it "can determine repeat guesses of the same letter" do
    game.guess('h')
    expect(board).to receive(:repeat_guess)
    game.guess('h')
  end
end
