require_relative 'lib/secret_word_selector'

selector = SecretWordSelector.new
puts "Random word: #{selector.select_secret_word}"