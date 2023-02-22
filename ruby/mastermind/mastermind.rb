class Mastermind
  # Possible colors for the code and their corresponding letters
  COLORS = {
    'r' => 'red',
    'o' => 'orange',
    'y' => 'yellow',
    'g' => 'green',
    'b' => 'blue',
    'p' => 'purple'
  }

  # Initialize the game with the mode and the number of turns left
  def initialize(mode)
    @mode = mode
    @turns_left = 12
  end

  # Generate a random code of four letters from the possible colors
  def generate_code
    code = ""
    4.times do
      code += COLORS.keys.sample
    end
    code
  end

  # Play the game
  def play
    # Print the game instructions
    puts "Welcome to Mastermind!"
    if @mode == "creator"
      puts "You are the creator of the secret code."
      puts "Please choose a secret code of four colors from the following list: #{COLORS.values.join(", ")}"
      @code = gets.chomp.downcase
    else
      puts "The computer has generated a secret code of four colors from the following list: #{COLORS.values.join(", ")}"
      @code = generate_code
    end
    puts "You have 12 turns to guess the code. After each guess, the computer will tell you how many colors you got right and how many are in the correct position."

    # Loop through the turns
    while @turns_left > 0
      # Ask the user for a guess
      puts "Guess the code (e.g. 'rgby'): "
      guess = gets.chomp.downcase

      # Check if the guess is valid (i.e. has four letters from the possible colors)
      if guess.match(/^[#{COLORS.keys.join}]{4}$/)
        # Evaluate the guess and print the result
        correct_positions = 0
        correct_colors = 0
        guess.chars.each_with_index do |letter, index|
          if letter == @code[index]
            correct_positions += 1
          elsif @code.include?(letter)
            correct_colors += 1
          end
        end
        puts "You got #{correct_positions} colors in the correct position and #{correct_colors} correct colors but in the wrong position."

        # Check if the guess is correct and end the game if it is
        if guess == @code
          puts "Congratulations, you guessed the code!"
          return
        end

        # Decrement the number of turns left
        @turns_left -= 1
      else
        # Print an error message if the guess is invalid
        puts "Invalid guess. Please enter four letters from the following list: #{COLORS.values.join(", ")}"
      end
    end

    # Print a message if the user runs out of turns
    puts "Sorry, you ran out of turns. The code was #{@code}. Better luck next time!"
  end
end

game = Mastermind.new
game.play
