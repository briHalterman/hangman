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
    guess = gets.chomp.downcase

    if guess == 'save'
      Save.save_game(self)
      puts "Game saved!"
      exit
    end

    guess
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
    if !display_word_state.include?('_')
      puts
      puts display_word_state
      puts "You guessed '#{@secret_word}'! You win!"
      exit
    end
  end

  def play_round
    # puts "Secret word: #{@secret_word}" # For development and testing
    puts
    puts "Strikes: #{@strike_counter}"
    puts "Incorrect guesses: #{@incorrect_guesses}"

    puts display_word_state
    guess = get_player_guess
    return unless validate_guess(guess)
    process_guess(guess)
  end

  def play_game

    puts "Welcome to the Guillotine!"
    puts "Guess the word before you lose your head!"
    puts "Type 'save' at any time to save your game and quit."

    while @strike_counter < 6
      play_round
    end
    puts "Secret word: '#{@secret_word}'"
    puts "Too many strikes! Off with your head!"
  end
end