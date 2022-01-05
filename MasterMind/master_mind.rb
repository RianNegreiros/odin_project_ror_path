CODE = '1234'
quess = ''
attempts = 1
MAX_ATTEMPTS = 12

while quess != CODE && attempts <= MAX_ATTEMPTS
  quess = gets.chomp
  attempts += 1
end

if quess == CODE
  print "You quessed the code!"
else
  print "Sorry, you lose"
end