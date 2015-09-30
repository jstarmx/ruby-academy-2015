class Board
  def draw(word_state, incorrect_guesses)
    puts word_state
    if incorrect_guesses.any?
      puts 'Incorrect guesses: ' + incorrect_guesses.join(', ')
    end
    puts "\n"
  end

  def game_won
    abort('You won!')
  end

  def game_lost
    abort('Sorry, you lost!')
  end

  def repeat_guess(letter)
    puts "You've already guessed #{letter}, try another letter!"
  end
end
