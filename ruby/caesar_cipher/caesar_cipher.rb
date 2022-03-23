def caesar_cipher(plaintext, factor)
  codepoints_array = []

  a_codepoint = 'a'.ord

  plaintext.split('').each do |letter|
    if letter =~ /[^a-zA-Z]/
      codepoints_array << letter.bytes.join('').to_i
    else
      shifted_codepoint = letter.downcase.bytes.join('').to_i + factor
      codepoints_array << (shifted_codepoint - a_codepoint) % 26 + a_codepoint
    end
  end
  ciphertext = codepoints_array.pack 'C*'
  puts ciphertext
end
caesar_cipher("What a string!", 5)