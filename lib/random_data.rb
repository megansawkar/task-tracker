module RandomData
  def self.random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end

  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0, rand(3..8)].join
  end
end
