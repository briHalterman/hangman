require 'yaml'

class Save
  SAVE_FILE = 'save.yaml'

  def self.save_game(game)
    File.open(SAVE_FILE, 'w') do |file|
      file.write(YAML.dump(game))
    end
  end
end