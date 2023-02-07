class Node
  attr_accessor :value, :parent, :children

  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end
end

class knight
  attr_accessor :all_squares_covered, :start

  def initialize(start, target)
    @all_squares_covered = false
    @reached_target = false
    @squares_to_cover = create_board(start)
    @start = Node.new(start)
  end

  def create_board(start)
    board = []
    (0..7).each do |row|
      (0..7).each do |column|
        board << [row, column]
      end
    end
    board.delete(start)
    board
  end

  def build_map
    squares = [@start]
    plan_route(squares)
  end

  def plan_route(squares)
    moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    new_squares = []

    while @squares_to_cover.length > 0
      squares.each do |square|
        new_positions = moves.map do |move|
          if check_square([square.value[0] + move[0], square.value[1] + move[1]])
            new_squares << Node.new([square.value[0] + move[0], square.value[1] + move[1]], square)
          end
        end
      end
      plan_route(new_squares)
    end
  end

  def check_square(square)
    square.each do |s|
      if x < 0 || x > 7 || y < 0 || y > 7
        return false
      end
    end

    if @squares_to_cover.include?(square)
      @squares_to_cover.delete(square)
    end
  end

  def map_path(target)
    queue = [@start]
    find_path(queue, target)
  end

  def find_path(queue, target)
    while queue.length > 0
      current = queue.shift
      if current.value == target
        return current
      else
        current.children.each do |child|
          queue << child
        end
      end
      find_path(queue, target)
    end
  
    
    def print_path(node)
      path = []
      while node.parent != nil
        path << node.value
        node = node.parent
      end
      path << node.value
      path.reverse
    end
end

def knight_moves(start, target)
  knight = Knight.new(start, target)
  knight.build_map
  path = knight.map_path(target)
  puts "You made it in #{path.length - 1} moves! Here's your path:"
  knight.print_path(path).each { |move| puts move.to_s }
end

### Examples

knight_moves([3,3], [4,3])
knight_moves([3,3], [0,0])
knight_moves([0,0], [7,0])
knight_moves([2,6], [2,6])