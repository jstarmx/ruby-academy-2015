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
			if @word.complete?(@correct_guesses)
				@board.game_won
			end
		else
			@incorrect_guesses << letter
			
			if incorrect_guess_limit_exceeded?
				@board.game_lost
			end
		end

		draw
	end

	def draw
		@board.draw(@word.state(@correct_guesses), @incorrect_guesses)
	end

	private

	def incorrect_guess_limit_exceeded?
		@incorrect_guesses.size == incorrect_guess_limit
	end

	def incorrect_guess_limit
		9
	end
end