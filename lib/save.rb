require 'yaml'

class Save
  SAVE_FILE = 'save.yaml'

  def self.save_game(game)
    File.open(SAVE_FILE, 'w') do |file|
      file.write(YAML.dump(game))
    end
  end

  def self.load_game
    if File.exist?(SAVE_FILE)
      YAML.unsafe_load_file(SAVE_FILE)
    else
      puts "Saved game not found."
      exit
    end
  end
end