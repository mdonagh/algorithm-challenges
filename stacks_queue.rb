# Implement a MyQueue class which implements a queue using two stacks.
# Run tests with rspec stacks_queue.rb

class MyQueue
  attr_accessor :stack_one, :stack_two
  def initialize
    @stack_one = []
    @stack_two = []
  end

  def show_contents
     @stack_one.join(' ')
  end

  def push(item)
    @stack_one.push(item)
  end

  def pop
    @stack_two = stack_one.reverse
    item = @stack_two.pop
    @stack_one = @stack_two.reverse
    item
  end

end

describe "MyQueue" do
    it "it can process one element" do
      queue = MyQueue.new
      queue.push("cat")
      expect(queue.pop).to eq("cat")
      expect(queue.show_contents).to eq("")
    end

    it "it can process multiple elements" do
      queue = MyQueue.new
      queue.push("dog")
      queue.push("cat")
      queue.push("mouse")
      expect(queue.pop).to eq("dog")
      expect(queue.show_contents).to eq("cat mouse")
    end

end
