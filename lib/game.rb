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
end