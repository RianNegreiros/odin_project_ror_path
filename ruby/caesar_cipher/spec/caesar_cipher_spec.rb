RSpec.describe "#caesar_cipher" do
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

  context "when given an empty string" do
    it "returns an empty string" do
      expect(caesar_cipher("", 3)).to eq("")
    end
  end

  context "when given a string with no letters" do
    it "returns the original string" do
      expect(caesar_cipher("1234567", 3)).to eq("1234567")
    end
  end

  context "when given a string with letters" do
    it "shifts the letters by the specified amount" do
      expect(caesar_cipher("hello", 3)).to eq("khoor")
    end

    it "wraps around to the beginning of the alphabet if necessary" do
      expect(caesar_cipher("xyz", 3)).to eq("abc")
    end

    it "handles shifts that are greater than 26" do
      expect(caesar_cipher("hello", 29)).to eq("khoor")
    end

    it "handles shifts that are negative" do
      expect(caesar_cipher("khoor", -3)).to eq("hello")
    end
  end
end
