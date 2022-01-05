CODE = ['1', '2', '3', '4']
quess = ''
attempts = 1
MAX_ATTEMPTS = 12

while quess != CODE && attempts <= MAX_ATTEMPTS
  raw_quess = gets.chomp
  quess = raw_quess.split('')

  number_correct = 0
  if quess[0] == CODE[0]
    number_correct += 1
  end
  if quess[1] == CODE[1]
    number_correct += 1
  end
  if quess[2] == CODE[2]
    number_correct += 1
  end
  if quess[3] == CODE[3]
    number_correct += 1
  end
  attempts += 1
end

if quess == CODE
  print "You quessed the code!"
else
  print "Sorry, you lose"
end