require_relative 'word'

class Game
  attr_reader :incorrect_guesses

  def play(word)
    @correct_word = ''
    @correct_guesses = {}
    @incorrect_guesses = []
    @word = Word.new(word)
  end

  def guess(input)
    unless invalid_guess?(input) || repeat_guess?(input)
      if @word.match?(input)
        add_correct_guess(input)
      else
        add_incorrect_guess(input)
      end
    end
  end

  def state
    if @correct_word.length > 1
      @correct_word
    else
      @word.state(@correct_guesses)
    end
  end

  def incorrect_guesses_count
    @incorrect_guesses.size
  end

  def incorrect_guesses_string
    @incorrect_guesses.join(', ')
  end

  def finished?
    won? || lost?
  end

  def won?
    @word.word == @correct_word || @word.complete?(@correct_guesses)
  end

  def lost?
    incorrect_guesses_count == incorrect_guess_limit
  end

  def repeat_guess?(input)
    @incorrect_guesses.include?(input) || @correct_guesses.fetch(input, false)
  end

  def invalid_guess?(input)
    (input.length > 1 && input.length != @word.word.length) || input[/^[a-zA-Z]+$/].nil?
  end

  private

  def add_correct_guess(input)
    if input.size > 1
      @correct_word = input
    else
      @correct_guesses[input] = @word.letter_indexes(input)
    end
  end

  def add_incorrect_guess(input)
    @incorrect_guesses << input
  end

  def incorrect_guess_limit
    11
  end
end
