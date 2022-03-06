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
end