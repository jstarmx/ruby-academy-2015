require 'word'

class Game
  def initialize(word, board)
    @word = Word.new(word)
    @correct_guesses = {}
    @incorrect_guesses = []
    @board = board
  end

  def start
    draw
  end

  def guess(letter)
    if is_repeat_guess?(letter)
      @board.repeat_guess(letter)
      return
    end

    indexes = @word.letter_indexes(letter)

    if indexes.any?
      add_correct_guess(letter, indexes)
    else
      add_incorrect_guess(letter)
    end

    draw
  end

  def draw
    @board.draw(@word.state(@correct_guesses), @incorrect_guesses)
  end

  private

  def is_repeat_guess?(letter)
    @incorrect_guesses.include?(letter) || @correct_guesses.fetch(letter, false)
  end

  def add_correct_guess(letter, indexes)
    @correct_guesses[letter] = indexes
    if @word.complete?(@correct_guesses)
      @board.game_won
    end
  end

  def add_incorrect_guess(letter)
    @incorrect_guesses << letter
    if incorrect_guess_limit_exceeded?
      @board.game_lost
    end
  end

  def incorrect_guess_limit_exceeded?
    @incorrect_guesses.size == incorrect_guess_limit
  end

  def incorrect_guess_limit
    9
  end
end
