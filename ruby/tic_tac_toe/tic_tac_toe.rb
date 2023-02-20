class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3, " ") }
    @current_player = "X"
  end
  
  def print_board
    puts "  1 2 3"
    puts "1 #{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"
    puts "  -+-+-"
    puts "2 #{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"
    puts "  -+-+-"
    puts "3 #{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"
  end
  
  def make_move(row, col)
    if @board[row][col] == " "
      @board[row][col] = @current_player
      switch_player
      true
    else
      false
    end
  end
  
  def game_over?
    winner? || tie?
  end
  
  def winner?
    # check rows
    @board.each do |row|
      return true if row.uniq.length == 1 && row[0] != " "
    end
    
    # check columns
    @board.transpose.each do |col|
      return true if col.uniq.length == 1 && col[0] != " "
    end
    
    # check diagonals
    return true if [@board[0][0], @board[1][1], @board[2][2]].uniq.length == 1 && @board[0][0] != " "
    return true if [@board[0][2], @board[1][1], @board[2][0]].uniq.length == 1 && @board[0][2] != " "
    
    false
  end
  
  def tie?
    @board.flatten.none? { |cell| cell == " " }
  end
  
  private
  
  def switch_player
    @current_player = (@current_player == "X") ? "O" : "X"
  end
end

game = TicTacToe.new

puts "Welcome to Tic-Tac-Toe!"
puts "Player 1: X"
puts "Player 2: O"
puts ""

until game.game_over?
  game.print_board
  puts ""
  
  player = (game.instance_variable_get(:@current_player) == "X") ? 1 : 2
  puts "Player #{player}, make your move (row column):"
  
  move = gets.chomp.split.map(&:to_i)
  if game.make_move(move[0]-1, move[1]-1)
    puts ""
  else
    puts "Invalid move. Try again."
  end
end

game.print_board
puts ""

if game.winner?
  player = (game.instance_variable_get(:@current_player) == "X") ? 2 : 1
  puts "Congratulations, Player #{player}! You win!"
else
  puts "It's a tie!"
end
