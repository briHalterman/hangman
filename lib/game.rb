# holds secret word
# tracks guesses(correct & incorrect)
# limits and displays guesses remaining
# displays word with guessed letters

class Game
  def initialize
    @secret_word = SecretWordSelector.new.select_secret_word
    @strike_counter = 0
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def display_word_state
    @secret_word.chars.map do |letter|
      if @correct_guesses.include?(letter)
        letter
      else
        '_'
      end
    end.join(' ')
  end

  def get_player_guess
    puts "Guess a letter:"
    gets.chomp.downcase
  end

  def validate_guess(guess)
    guesses = @correct_guesses + @incorrect_guesses

    if guess.length != 1 || !guess.match?(/^[a-z]$/) || guesses.include?(guess)
      puts "Please choose exactly one letter you haven't already guessed"
      return
    end
    true
  end

  def process_guess(guess)
    if @secret_word.include?(guess)
      @correct_guesses << guess
    else
      @incorrect_guesses << guess
      @strike_counter += 1
      puts "Strike #{@strike_counter}!"
    end
  end
end