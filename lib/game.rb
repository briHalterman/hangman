# holds secret word
# tracks guesses(correct & incorrect)
# limits and displays guesses remaining
# displays word with guessed letters

class Game
  def initialize
    @secret_word = SecretWordSelector.new.select_secret_word
    @strikes = 0
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
end