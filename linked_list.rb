# Implement an algorithm to find the kth to last element of a singly linked list.
# Run tests with rspec linked_list.rb

  def kth_from_last_element(head, k)
    cursor = head
    list_length = 1
    while(cursor.next)
      cursor = cursor.next
      list_length += 1
    end

    node_index = list_length - k
    cursor = head
    count = 1
    while(count < node_index)
      cursor = cursor.next
      count += 1
    end
    return cursor
  end

  class Node
    attr_accessor :data, :next

     def initialize(data)
       @data = data
       @next = nil
     end
  end

describe "#kth_from_last_element" do
    before(:all) do
      @head = Node.new('fourth_from_last')
      @head.next = Node.new('third_from_last')
      @head.next.next = Node.new('second_from_last')
      @head.next.next.next = Node.new('first_from_last')
      @head.next.next.next.next = Node.new('tail')
    end

    it "it return the second to last node" do
        second_from_last_node = kth_from_last_element(@head, 2)
        expect(second_from_last_node.data).to eq("second_from_last")
    end

    it "it can return the last node" do
        second_from_last_node = kth_from_last_element(@head, 0)
        expect(second_from_last_node.data).to eq("tail")
    end

    it "it can return the fourth from last node" do
        second_from_last_node = kth_from_last_element(@head, 4)
        expect(second_from_last_node.data).to eq("fourth_from_last")
    end
end
