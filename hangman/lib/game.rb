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
		indexes = @word.letter_indexes(letter)
		
		if indexes.any?
			@correct_guesses[letter] = indexes
		else
			@incorrect_guesses << letter
		end

		draw
	end

	def draw
		@board.draw(@word.state(@correct_guesses), @incorrect_guesses)
	end
end