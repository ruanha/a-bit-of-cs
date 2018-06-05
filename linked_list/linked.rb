class LinkedList
  @head = nil
  def initialize
    @head = Node.new nil, :head
  end

  def append value
    tail_node = tail
    tail_node.next_node = Node.new nil, value
  end

  def prepend value
    @head.next_node = Node.new(@head.next_node, value)

  end

  def size
    node = @head
    nodes = 0
    while node.next_node
      nodes+=1
      node = node.next_node
    end
    nodes
  end

  def head
    @head.next_node
  end

  def tail
    node = @head
    while node.next_node
      node = node.next_node
    end
    node
  end

  def at_index (index)
    node = @head.next_node
    index.times {node = node.next_node}
    node
  end

  def pop
    second_last_node = at_index(size-2)
    second_last_node.next_node = nil
  end

  def contains? value
    node = head
    while node
      if node.value == value
        return true
      else
        node = node.next_node
      end
    end 
    false
  end

  def find data
    node = head
    i = 0
    while node
      if node.value == data
        return i
      else
        i += 1
        node = node.next_node
      end
    end
    false
  end

  def to_s
    node = @head
    string = ""
    while node.next_node
      string += "(#{node.value}) -> "
      node = node.next_node
    end
    string += "(#{node.value}) -> "
    string += "nil"
  end

  def remove_at(index)
    node_before = at_index(index-1)
    node_after = at_index(index+1)
    node_before.next_node = node_after
  end
end


class Node
  attr_accessor :next_node, :value
  def initialize next_node=nil, value=nil
    @next_node = next_node
    @value = value
  end
end

linked_list = LinkedList.new

puts "test empty list"
puts "size: #{linked_list.size}"
puts linked_list.to_s
puts ""

puts "test append"
linked_list.append(123)
linked_list.append(456)
puts "size: #{linked_list.size}"
puts linked_list.to_s
puts ""

puts "test prepend"
linked_list.prepend(0)
linked_list.prepend("my fav numbers")
puts "size: #{linked_list.size}"
puts linked_list.to_s
puts ""

puts "test tail and head"
puts "head: #{linked_list.head.value}"
puts "tail: #{linked_list.tail.value}"
puts ""


puts "test #at_index"
puts "at index 0 #{linked_list.at_index(0).value}"
puts "at index 3 #{linked_list.at_index(3).value}"
begin
  puts "at index 4 #{linked_list.at_index(4).value}"
rescue
  puts "succes it threw an error!"
end
puts ""

puts "test pop"
puts linked_list.to_s
linked_list.pop
puts linked_list.to_s
puts ""

puts "test contains?"
puts linked_list.contains? 123
puts linked_list.contains? 345
puts ""

puts "test find(data)"
puts linked_list.find 123
puts linked_list.find 345
puts ""

puts "test remove_at(index)"
puts linked_list.to_s
linked_list.remove_at(1)
puts linked_list.to_s
puts ""

puts "test insert_at"
puts linked_list.to_s
linked_list.insert_at(0)
puts linked_list.to_s
puts linked_list.to_s
linked_list.insert_at(2)
puts linked_list.to_s
puts ""