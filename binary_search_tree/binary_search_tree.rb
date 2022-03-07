class Node
  def initialize(data)
    @data = data
    @left_chid = nil
    @right_chil = nil
  end
end

class Tree
  def initialize(arr)
    @array = arr.sort.uniq
    @root = build_tree(array)
  end

  # build balanced binary tree based on an array of data and return the root
  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2

    root = Node(arr[mid])
    root.left = build_tree(arr.slice(0, mid))
    root.right = build_tree(arr.slice(mid+1, arr.length))
    root
  end

  def insert(value)
    return Node.new(value) if @root.nil?

    curr_node = @root
    prev_node = @root

    while !curr_node.nil?
      prev_node = curr_node
      if value < curr_node.data
        curr_node = curr_node.left
      else
        curr_node = curr_node.right
      end
    end

    if value < prev_node.data
      prev_node.left = Node.new(value)
    else
      prev_node.right = Node.new(value)
    end
  end

  def delete(value, node = self.root)
    return nil if @root.nil?

    if value == node.data
      return nil if !node.left && !node.right
      return node.right if !node.left
      return node.left if !node.right

      tmp = node.right
      while !tmp.left
        tmp = tmp.left
      end

      node.data = tmp.value
      node.right = delete(tmp.value, node.right)

    elsif value < node.data
      node.left = delete(value, node.left)
      return node
    else
      node.right = delete(value, node.left)
      return node
    end
  end

  def find(value, node = self.root)
    return nil if @root.data.nil?
    return @root if @root.data == value

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    end
  end

  # given block, yield each node, if no block is given return an array of values
  def level_order
    result = []
    queue = [@root]
    
    while queue.length
      curr_node = queue.shift()
      block_given? ? yield(curr_node) : result << curr_node.data
      
      queue << curr_node.left if !curr_node.left.nil?
      queue << curr_node.right if !curr_node.right.nil?
    end
    return result if !block_given?
  end

  def inorder(node = self.root)
    nodes = []

    if !node.left.nil?
      yield node if block_given?
      inorder(node.left)
    end

    nodes << node.data

    if !node.right.nil?
      yield node if block_given?
      inorder(node.right)
    end

    return nodes if !block_given?
  end

  def preorder(node = self.root)
    nodes = []
    nodes << node.data

    if !node.left.nil?
      yield node if block_given?
      inorder(node.left)
    end

    if !node.right.nil?
      yield node if block_given?
      inorder(node.right)
    end

    return nodes if !block_given?
  end

  def postorder(node = self.root)
    nodes = []
    
    if !node.left.nil?
      yield node if block_given?
      inorder(node.left)
    end
    
    if !node.right.nil?
      yield node if block_given?
      inorder(node.right)
    end
    
    nodes << node.data

    return nodes if !block_given?
  end

  def height(node)
    return 0 if node.nil?

    lheight = height(node.left)
    rheight = height(node.right)

    if lheight > rheight
      lheight + 1
    else
      rheight + 1
    end
  end

  def depth(root = self.root)
    return 0 if root.nil?
    return 1 if root.left.nil? && root.right.nil?
    return depth(root.right) + 1 if root.left.nil?
    return depth(root.left) + 1 if root.right.nil?
  end

  def balanced?(root = self.root)
    return true if root.nil?

    lh = height(root.left)
    lr = height(root.right)

    (lh - rh) <= 1 && balanced(root.left) && balanced(node.right) ? true : false
  end

  def rebalance(root = self.root)
    @root = build_tree(inorder)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
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