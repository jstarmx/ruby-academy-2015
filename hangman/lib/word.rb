class Word
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def state(correct_guesses)
    word_state = Array.new(@word.size, '_')

    correct_guesses.each do |letter, indexes|
      indexes.each { |index| word_state[index] = letter }
    end

    word_state.join
  end

  def complete?(correct_guesses)
    correct_guesses.values.flatten.size == @word.size
  end

  def letter_indexes(letter)
    (0...@word.size).find_all { |i| @word[i] == letter }
  end
end
