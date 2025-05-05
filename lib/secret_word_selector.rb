# Word Selector Class

class SecretWordSelector

  def select_secret_word
    dictionary = 'google-10000-english-no-swears.txt'
    word_bank = File.readlines(dictionary)
    valid_word_bank = word_bank.map(&:strip).select { |word| word.length.between?(5, 12) }
    valid_word_bank.sample.downcase
  end
end