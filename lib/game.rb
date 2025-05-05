# Game class

require_relative 'guess'

class Game
  attr_reader :secret_word, :correct_guesses, :incorrect_guesses
  attr_accessor :strike_counter

  def initialize
    @secret_word = SecretWordSelector.new.select_secret_word
    @strike_counter = 0
    @correct_guesses = []
    @incorrect_guesses = []
    @guess_handler = Guess.new(self)
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

  def play_round
    # puts "Secret word: #{@secret_word}" # For development and testing
    puts
    puts "Strikes: #{@strike_counter}"
    puts "Incorrect guesses: #{@incorrect_guesses}"

    puts display_word_state
    guess = @guess_handler.get_player_guess
    return unless @guess_handler.validate_guess(guess)
    @guess_handler.process_guess(guess)
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