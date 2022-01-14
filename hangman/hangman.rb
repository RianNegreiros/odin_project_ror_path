def select_random_word
  dictionary = File.open("5desk.txt")

  words = Array.new
  random_word = ''

  dictionary.each do |word|
    words.append(word)
  end

  until random_word.length >= 5 && random_word.length <= 12 do
    random_word = words.sample
  end

  random_word
end

def print_word(values)
  print("\t")
  values.each { |x|
    print(x)
  }
  print("\t")
end

def check_win(values)
  values.each { |char|
    if char == '_'
      return false
    end
  }
  true
end