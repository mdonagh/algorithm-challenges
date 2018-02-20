# Implement a function to check if a binary tree is balanced. 
# For the purposes of this question, a balanced tree is defined to be a tree such that 
# the heights of the two subtrees of any node never differ by more than one.

# Run tests with rspec tree_balanced.rb

def is_tree_balanced(root)
  return true if(!root)

  diff = height(root.left) - height(root.right)
  if diff.abs > 1
    return false
  end

  return ( is_tree_balanced(root.left) && is_tree_balanced(root.right) )
end

def height(root)
  return 0 if(!root)
  return [height(root.left) + 1, height(root.right) + 1].max
end

  class Node
    attr_accessor :data, :left, :right

     def initialize(data)
       @data = data
       @left = nil
       @right = nil
     end
  end

=begin

First tree (balanced)
  1
 / \
2   3

Second Tree (balanced)
  1
 /  \
2    3
    /  \
   6    7
   
Third tree (unbalanced)
  1
    \
     3
    /  \
   6    7

=end

describe "#is_tree_balanced" do

    it "it returns true for the first tree" do
      root = Node.new(1)
      root.left = Node.new(2)
      root.right = Node.new(3)
      expect(is_tree_balanced(root)).to eq(true)
    end

    it "it returns true for the second tree" do
      root = Node.new(1)
      root.left = Node.new(2)
      root.right = Node.new(3)
      root.right.right = Node.new(7)
      root.right.left = Node.new(6)
      expect(is_tree_balanced(root)).to eq(true)
    end

    it "it returns false for the third tree" do
      root = Node.new(1)
      root.right = Node.new(3)
      root.right.right = Node.new(7)
      root.right.left = Node.new(6)
      expect(is_tree_balanced(root)).to eq(false)
    end

end
