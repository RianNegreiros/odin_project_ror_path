class MasterMind
  MIN = 1
  MAX = 9
  CODE = 4.times.map { Random.rand(MIN..MAX).to_s }
  guess = ''
  attempts = 1
  MAX_ATTEMPTS = 12
  print CODE

  def self.check_code(code, guess)
    correct_position = 0
    correct_value = 0
    code_copy = code.dup
    (0..guess.length - 1).each do |i|
      correct_position += 1 if guess[i] == code[i]
      if code_copy.count(guess[i]).positive?
        correct_value += 1
        code_copy.delete(guess[i])
      end
    end
    [correct_position, correct_value]
  end

  print "Welcome to MasterMind! You will need to guess a #{CODE.length} digit secret code.\n"
  print "The code will contain digits from #{MIN} to #{MAX}."

  while guess != CODE && attempts <= MAX_ATTEMPTS
    print "\nAttempt #{attempts}\n"
    print 'Enter 4 digits: '
    raw_guess = gets.chomp
    guess = raw_guess.split('')

    while guess.length != CODE.length
      print "Please enter #{CODE.length} digits: "
      raw_guess = gets.chomp
      guess = raw_guess.split('')
    end

    code_checked = self.check_code(CODE, guess)
    number_correct = code_checked[0]
    correct_values = code_checked[1]

    print "\nYou got #{correct_values} correct." if correct_values < 4
    print "You got #{number_correct} in the right position.\n"
    attempts += 1
  end

  if guess == CODE
    print 'You guessed the code!'
  else
    print 'Sorry, you lose'
  end
end

MasterMind.new
