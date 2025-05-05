require_relative 'lib/secret_word_selector'
require_relative 'lib/game'
require_relative 'lib/save'

def prompt_game_mode
  puts "Type 'new' to start a new game."
  puts "Type 'load' to load the previously saved game."
  input = gets.chomp.downcase

  if input == 'new'
    Game.new
  elsif input == 'load'
    Save.load_game
  else
    prompt_game_mode
  end
end

game = prompt_game_mode
game.play_game