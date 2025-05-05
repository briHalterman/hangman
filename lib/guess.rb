#  Guess class

class Guess
  def initialize(game)
    @game = game
  end

  def get_player_guess
    puts "Guess a letter:"
    guess = gets.chomp.downcase

    if guess == 'save'
      Save.save_game(@game)
      puts "Game saved!"
      exit
    end

    guess
  end

  def validate_guess(guess)
    guesses = @game.correct_guesses + @game.incorrect_guesses

    if guess.length != 1 || !guess.match?(/^[a-z]$/) || guesses.include?(guess)
      puts "Please choose exactly one letter you haven't already guessed"
      return
    end
    true
  end

  def process_guess(guess)
    if @game.secret_word.include?(guess)
      @game.correct_guesses << guess
    else
      @game.incorrect_guesses << guess
      @game.strike_counter += 1
      puts "Strike #{@game.strike_counter}!"
    end
    if !@game.display_word_state.include?('_')
      puts
      puts @game.display_word_state
      puts "You guessed '#{@game.secret_word}'! You win!"
      exit
    end
  end
end