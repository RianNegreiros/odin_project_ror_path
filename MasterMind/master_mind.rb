CODE = '1234'
quess = ''
attempts = 1

while quess != CODE
  quess = gets.chomp
  attempts = attempts += 1
end

print "You quessed the code!"