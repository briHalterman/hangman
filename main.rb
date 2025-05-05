require_relative 'lib/secret_word_selector'
require_relative 'lib/game'

game = Game.new
puts "Secret word: #{game.instance_variable_get(:@secret_word)}"
puts "Strikes: #{game.instance_variable_get(:@strikes)}"
puts "Correct guesses: #{game.instance_variable_get(:@correct_guesses)}"
puts "Incorrect guesses: #{game.instance_variable_get(:@incorrect_guesses)}"
