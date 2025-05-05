require_relative 'lib/secret_word_selector'
require_relative 'lib/game'

puts "Welcome to the Guillotine!"
puts "Guess the word before you lose your head!"

game = Game.new
game.play_game