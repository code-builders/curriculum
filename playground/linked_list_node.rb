class LinkedList
  attr_accessor :head

  def initialize(head)
    @head = head
  end

  def search(term)
    node = @head
    until node.value == term
      return nil if node.nxt.nil?
      node = node.nxt
    end
    node
  end

  def push(v)
    node     = @head
    until node.nxt.nil?
      node = node.nxt
    end
    node.nxt = Node.new(v)
  end

  def insert_at(v, term)
    node = search(term)
    return nil if node.nil?
    tmp_node = node.nxt
    new_node = Node.new(v, tmp_node)
    node.nxt = new_node
  end

end


class Node
  attr_accessor :value, :nxt

  def initialize(value, nxt=nil)
    @value = value
    @nxt   = nxt
  end

end


# LinkedList.new(Node.new("a", Node.new("b")))
