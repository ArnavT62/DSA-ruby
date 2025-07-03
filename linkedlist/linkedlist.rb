class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head
    @head = node
    @tail = node if @tail.nil?
  end

  def size
    total = 0
    node = @head
    while node != nil
      total += 1
      node = node.next_node
    end
    return total
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    node = @head
    count = 0
    while count < index && node
      node = node.next_node
      count += 1
    end
    return node
  end

  def pop
    return nil if @head.nil?

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end

    prev = @head
    curr = @head.next_node
    while curr.next_node
      prev = curr
      curr = curr.next_node
    end
    prev.next_node = nil
    @tail = prev
  end

  def contains?(value)
    node = @head
    while node != nil
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    while node != nil
      return node if node.value == value
      node = node.next_node
    end
    nil
  end

  def to_s
    node = @head
    str = ""
    while node != nil
      str += "( #{node.value} ) -> "
      node = node.next_node
    end
    str += "nil"
    return str
  end
end
