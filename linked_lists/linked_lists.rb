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
    while curr_node.next_node != nil
      curr_node = curr_node.next_node
    end
    curr_node.next_node = Node.new(value)
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    return @head = Node.new(value) if @head.nil?

      curr_node = Node.new(value)
      curr_node.next_node = @head
      @head = curr_head
  end

  def size
    count = 0
    return count if @head.nil?

    count += 1
    curr_node = @head
    while (!curr_node.next_node.nil?)
      curr_node = curr_node.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    curr_node = @head
    return curr_node if node.next.nil?
    
    while(!curr_node.next_node.nil?)
      curr_node = curr_node.next_node
    end
    curr_node
  end

  def at(index)
    curr_node = @head
    # Throw exception
    return nil if node.next.nil?

    index.times do 
      curr_node = curr_node.next_node
    end
    curr_node
  end

  def pop
    curr_node = @head
    while(!curr_node.next_node.nil?)
      curr_node = curr_node.next_node
    end
    curr_node.next_node = nil
  end

  def contains?(value)
    curr_node = @head
    while(!curr_node.nil?)
      return true if curr_node.value == value
      return false if !curr_node.next.nil?
      curr_node = curr_node.next_node
    end
  end

  def find(value)
    curr_node = @head
    while(!curr_node.nil?)
      return curr_node if curr_node.value == value
      return false if !curr_node.next.nil?
      curr_node = curr_node.next_node
    end
  end

  def to_s
    curr_node = @head
    print "( #{curr_node.value} ) ->"

    while(!curr_node.next_node.nil?)
      print "( #{ curr_node.value} ) ->"
      curr_node = curr_node.next_node
    end
    print "#{curr_node.value}"
  end

  def insert_at(value, index)
    curr_node = @head
    # Throw exception
    return nil if node.next.nil?

    index.times do 
      curr_node = curr_node.next_node
    end
    curr_node = Node.new(value)
    curr_node.next_node = @head
  end

  def remove_at(index)
    curr_node = @head
    index.times do
      curr_node = curr_node.next_node
    end
    curr_node.next_node = nil
  end
end