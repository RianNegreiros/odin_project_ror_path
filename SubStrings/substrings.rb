dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring (str, arr)
  substrings = {}
  arr.each do |string|
    substrings[string] = string.downcase.scan(/(?=#{word})/).count if string.downcase.include?(word)
  end
  substrings
end

puts substring("Below", dictionary)
puts substring("Howdy partner, sit down! How's it going?", dictionary)