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
end