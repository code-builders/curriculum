module Tree
  class Node
    attr_accessor :value, :left, :right
    def initialize(value)
      @value = value
    end

    def monkey(v)
      if v > value
        insert_right(v)
      elsif v < value
        insert_left(v)
      else
        nil
      end
    end
    alias_method :add, :monkey

    def insert_left(v)
      if left.nil?
        self.left = Node.new(v)
      else
        left.monkey(v)
      end
    end

    def insert_right(v)
      if right.nil?
        self.right = Node.new(v)
      else
        right.monkey(v)
      end
    end

    def self.search(v, n)
      if n.nil? || v == n.value
        n
      elsif v > n.value
        search(v, n.right)
      else
        search(v, n.left)
      end
    end

  end
end

# root.left  = Tree::Node.new(50)
# root.right = Tree::Node.new(150)
# root.left.right = Tree::Node.new(75)
#
# Tree::Node.search(75, root) # => <Tree::Node 2325345345 @value=75>
# Tree::Node.search(200, root) # => nil

root = Tree::Node.new(100)
root.monkey(80)
