require "yaml"

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

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
  values.each { |x|
    print("#{x}\n")
  }
end

def check_win(values)
  values.each { |char|
    if char == '_'
      return false
    end
  }
  true
end

def hangman(word)
  word_display = []

  correct_letters = []

  incorrect = []

  chances = 0

  limit = 5

  word.each_char { |char|
    word_display.append('_')
    correct_letters.append(char.upcase)
  }

  while true
    print_word(word_display)
    print("Incorrect characters: #{incorrect}\n")

    print("Enter a character = ")
    input = gets.chomp

    if input.length != 1
      print("Only one letter.")
      next
    elsif input.numeric?
      print("Must be a letter.")
    elsif incorrect.include? input.upcase
      print("Already tried this letter")
      next
    end

    if correct_letters.include?(input.upcase) == false
      incorrect.append(input.upcase)

      chances += 1

      if chances == limit
        print("\nGAME OVER!\n")
        print("The word is: #{word.upcase}")
        break
      end
    else
      (0..word.length - 1).each do |i|
        if word[i].upcase == input.upcase
          word_display[i] = input.upcase
        end
      end
      if check_win(word_display)
        print("\nCongratulations!\n")
        print("The word is: #{word.upcase}")
        break
      end
    end
  end
end

hangman(select_random_word)