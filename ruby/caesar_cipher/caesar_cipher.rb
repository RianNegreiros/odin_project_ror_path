def caesar_cipher(string, shift)
  # Create an array of all the letters in the alphabet
  alphabet = Array('a'..'z')
  
  # Create a hash that maps each letter to its corresponding index in the alphabet array
  letter_index = Hash[alphabet.map.with_index.to_a]
  
  # Convert the input string to lowercase and split it into an array of characters
  string_array = string.downcase.split('')
  
  # Iterate over each character in the string
  new_string = string_array.map do |char|
    # If the character is not a letter, leave it as is
    if !alphabet.include?(char)
      char
    else
      # Determine the new index of the letter after shifting by the specified amount
      new_index = (letter_index[char] + shift) % 26
      
      # Map the new index back to its corresponding letter in the alphabet array
      alphabet[new_index]
    end
  end
  
  # Join the array of characters back into a string and return it
  new_string.join('')
end

encrypted = caesar_cipher("hello world", 3)
puts encrypted  # => "khoor zruog"
