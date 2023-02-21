def substrings(string, dictionary)
  # Convert string to lowercase to make it case-insensitive
  string = string.downcase
  
  # Initialize an empty hash to store the results
  result = Hash.new(0)
  
  # Loop through each word in the dictionary and check if it appears in the string
  dictionary.each do |word|
    # Count the number of occurrences of the word in the string using a regex
    count = string.scan(/#{word.downcase}/).length
    
    # If the word appears at least once, add it to the result hash
    result[word] = count if count > 0
  end
  
  result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"

result = substrings(string, dictionary)
puts result
