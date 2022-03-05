class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end
    # adds a new node containing value to the end of the list
  def append(value)
    curr_node = @head
    while curr_node.next != nil
      curr_node = curr_node.next
    end
    curr_node.next = Node.new(value, nil)
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      curr_node = Node.new(value)
      curr_node.next = @head
      @head = curr_head
    end
  end
end