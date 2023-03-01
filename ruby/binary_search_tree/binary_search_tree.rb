class Node
  attr_accessor :data, :left_child, :right_child

  def initialize(data)
    @data = data
    @left_child = nil
    @right_child = nil
  end
end

class Tree
  attr_reader :root

  def initialize(arr)
    @array = arr.sort.uniq
    @root = build_tree(@array)
  end

  # build balanced binary tree based on an array of data and return the root
  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2

    root = Node.new(arr[mid])
    root.left_child = build_tree(arr[0...mid])
    root.right_child = build_tree(arr[mid+1..-1])
    root
  end

  def insert(value)
    return @root = Node.new(value) if @root.nil?

    curr_node = @root
    prev_node = @root

    while !curr_node.nil?
      prev_node = curr_node
      if value < curr_node.data
        curr_node = curr_node.left_child
      else
        curr_node = curr_node.right_child
      end
    end

    if value < prev_node.data
      prev_node.left_child = Node.new(value)
    else
      prev_node.right_child = Node.new(value)
    end
  end

  def delete(value, node = @root)
    return nil if @root.nil?

    if value == node.data
      return nil if !node.left_child && !node.right_child
      return node.right_child if !node.left_child
      return node.left_child if !node.right_child

      tmp = node.right_child
      while tmp.left_child
        tmp = tmp.left_child
      end

      node.data = tmp.data
      node.right_child = delete(tmp.data, node.right_child)

    elsif value < node.data
      node.left_child = delete(value, node.left_child)
    else
      node.right_child = delete(value, node.right_child)
    end

    node
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if node.data == value

    if value < node.data
      find(value, node.left_child)
    else
      find(value, node.right_child)
    end
  end

  # given block, yield each node, if no block is given return an array of values
  def level_order
    result = []
    queue = [@root]

    while !queue.empty?
      curr_node = queue.shift
      block_given? ? yield(curr_node) : result << curr_node.data

      queue << curr_node.left_child if curr_node.left_child
      queue << curr_node.right_child if curr_node.right_child
    end

    result unless block_given?
  end

  def inorder(node = @root, nodes = [])
    return nodes unless node

    inorder(node.left_child, nodes)
    block_given? ? yield(node) : nodes << node.data
    inorder(node.right_child, nodes)

    nodes unless block_given?
  end

  def preorder(node = @root, nodes = [])
    return nodes unless node

    block_given? ? yield(node) : nodes << node.data
    preorder(node.left_child, nodes)
    preorder(node.right_child, nodes)

    nodes unless block_given?
  end

  def postorder(node = @root, &block)
    return [] if node.nil?
  
    nodes = []
    nodes += postorder(node.left, &block) if node.left
    nodes += postorder(node.right, &block) if node.right
    nodes << node.data
    block.call(node) if block_given?
    nodes
  end
  
  def height(node)
    return 0 if node.nil?
  
    [height(node.left), height(node.right)].max + 1
  end
  
  def depth(node = @root)
    return 0 if node.nil?
  
    left_depth = depth(node.left)
    right_depth = depth(node.right)
  
    [left_depth, right_depth].max + 1
  end
  
  def balanced?(node = @root)
    return true if node.nil?
  
    lh = height(node.left)
    rh = height(node.right)
  
    (lh - rh).abs <= 1 && balanced?(node.left) && balanced?(node.right)
  end
  
  def rebalance
    @root = build_tree(inorder)
  end
  
  def pretty_print(node = @root, prefix = '', is_left = true)
    return if node.nil?
  
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
  end

end

tree = Tree.build_tree(Array.new(15) { rand(1..100) })
tree.balanced?
tree.preorder
tree.postorder
tree.inorder
100.times { tree.insert(rand(1..100)) }
tree.balanced?
tree.rebalance
tree.balanced?
tree.preorder
tree.postorder
tree.inorder