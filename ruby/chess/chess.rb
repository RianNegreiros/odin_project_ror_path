class Chess
  attr_accessor :board, :player

  def initialize
    @board = Array.new(8) { Array.new(8, "-") }
    @player = 1
  end

  def display_board
    puts "  a b c d e f g h"
    @board.each_with_index do |row, i|
      print "#{8 - i} "
      row.each do |col|
        print "#{col} "
      end
      puts ""
    end
  end

  def make_move
    puts "Player #{@player}, enter your move (e.g. e2 e4): "
    move = gets.chomp.split(" ")
    start = [8 - move[0][1].to_i, move[0][0].ord - 97]
    finish = [8 - move[1][1].to_i, move[1][0].ord - 97]
    if valid_move?(start, finish)
      @board[finish[0]][finish[1]] = @board[start[0]][start[1]]
      @board[start[0]][start[1]] = "-"
      @player = (@player == 1 ? 2 : 1)
    else
      puts "Invalid move, try again."
    end
  end

  def valid_move?(start, finish)
    if @board[finish[0]][finish[1]] != "-"
      return false
    end
  
    row_diff = (finish[0] - start[0]).abs
    col_diff = (finish[1] - start[1]).abs
  
    if @player == 1
      if row_diff == 1 && col_diff == 0
        return true
      elsif row_diff == 2 && col_diff == 0 && start[0] == 6
        return true
      end
    else
      if row_diff == 1 && col_diff == 0
        return true
      elsif row_diff == 2 && col_diff == 0 && start[0] == 1
        return true
      end
    end
  
    false
  end

  def game_over?
    # Check for checkmate
    king_position = find_king(@player)
    if in_check?(king_position) && no_valid_moves?(king_position)
      puts "Checkmate! Player #{@player == 1 ? 2 : 1} wins!"
      return true
    end
  
    # Check for draw
    if draw?
      puts "Draw."
      return true
    end
  
    false
  end
  
  def in_check?(king_position)
    opponent = @player == 1 ? 2 : 1
    for row in 0...8
      for col in 0...8
        piece = @board[row][col]
        next if piece == "-" || piece[0].to_i != opponent
  
        piece_moves = get_valid_moves(row, col)
        if piece_moves.include?(king_position)
          return true
        end
      end
    end
  
    false
  end  

  def no_valid_moves?(king_position)
    for row in 0...8
      for col in 0...8
        piece = @board[row][col]
        next if piece == "-" || piece[0].to_i != @player
  
        piece_moves = get_valid_moves(row, col)
        piece_moves.each do |move|
          if move_results_in_check?(row, col, move) == false
            return false
          end
        end
      end
    end

    true
  end

  def move_results_in_check?(row, col, move)
    temp_board = @board.map { |row| row.clone }
    temp_board[move[0]][move[1]] = temp_board[row][col]
    temp_board[row][col] = "-"
  
    king_position = find_king_position
    temp_chess = Chess.new(temp_board, @player)
    return temp_chess.in_check?(king_position)
  end
  
  def find_king_position
    king = @player == 1 ? "K" : "k"
    for row in 0...8
      for col in 0...8
        return [row, col] if @board[row][col] == king
      end
    end
  end

  def draw?
    return false if in_check?
  
    for row in 0...8
      for col in 0...8
        piece = @board[row][col]
        if piece != "-" && piece.color == @player
          return false if has_valid_moves?(row, col)
        end
      end
    end
  
    return true
  end

  def has_valid_moves?(row, col)
    piece = @board[row][col]
  
    case piece
    when "P"
      return has_valid_pawn_moves?(row, col)
    when "R"
      return has_valid_rook_moves?(row, col)
    when "N"
      return has_valid_knight_moves?(row, col)
    when "B"
      return has_valid_bishop_moves?(row, col)
    when "Q"
      return has_valid_queen_moves?(row, col)
    when "K"
      return has_valid_king_moves?(row, col)
    end
  
    return false
  end

  def has_valid_pawn_moves?(row, col)
    piece_moves = get_valid_moves(row, col)
    piece_moves.each do |move|
      return true if move_results_in_check?(row, col, move) == false
    end
  
    false
  end

  def has_valid_rook_moves?(row, col)
    piece_moves = get_valid_moves(row, col)
    piece_moves.each do |move|
      return true if move_results_in_check?(row, col, move) == false
    end
  
    false
  end

  def has_valid_knight_moves?(row, col)
    piece_moves = get_valid_moves(row, col)
    piece_moves.each do |move|
      return true if move_results_in_check?(row, col, move) == false
    end
  
    false
  end

  def has_valid_bishop_moves?(row, col)
    piece_moves = get_valid_moves(row, col)
    piece_moves.each do |move|
      return true if move_results_in_check?(row, col, move) == false
    end
  
    false
  end

  def has_valid_queen_moves?(row, col)
    piece_moves = get_valid_moves(row, col)
    piece_moves.each do |move|
      return true if move_results_in_check?(row, col, move) == false
    end
  
    false
  end

  def has_valid_king_moves?(row, col)
    piece_moves = get_valid_moves(row, col)
    piece_moves.each do |move|
      return true if move_results_in_check?(row, col, move) == false
    end
  
    false
  end
end

game = Chess.new
while !game.game_over?
  game.display_board
  game.make_move
end
