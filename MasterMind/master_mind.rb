CODE = 4.times.map { Random.rand(1..9).to_s }
guess = ''
attempts = 1
MAX_ATTEMPTS = 12

while guess != CODE && attempts <= MAX_ATTEMPTS
  print "Enter 4 digits\n"
  raw_guess = gets.chomp
  guess = raw_guess.split('')

  number_correct = 0
  (0..CODE.length - 1).each do |i|
    number_correct += 1 if guess[i] == CODE[i]
  end

  print "\nYou got #{number_correct} correct.\n" if number_correct < 4
  attempts += 1
end

if guess == CODE
  print 'You guessed the code!'
else
  print 'Sorry, you lose'
end
