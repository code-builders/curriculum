module BinaryTree
  class Node
    attr_accessor :value, :left, :right
    def initialize(value)
      @value = value
    end

    def insert(v)
      if v < value
        if left
          left.insert(v)
        else
          self.left = BinaryTree::Node.new(v)
        end
      elsif v > value
        if right
          right.insert(v)
        else
          self.right = BinaryTree::Node.new(v)
        end
      else
        false
      end
    end
  end

  def self.search(value, node)
    if node.nil? || node.value == value
      node
    elsif value < node.value
      search(value, node.left)
    else
      search(value, node.right)
    end
  end
end
