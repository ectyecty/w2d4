class MyStack
  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    @store.pop
    @max.pop
    @min.pop
  end

  def push(item)
    @store.push(item)
    item > @max.last ? @max << item : @max << @max.last
    item < @min.last ? @min << item : @min << @min.last
  end

  def peek
    @store
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    @max.last
  end

  def min
    @min.last
  end
end

class StackQueue
  def initialize
    @store1 = MyStack.new
    @store2 = MyStack.new
  end

  def enqueue(item)
    @store1.push(item)
  end

  def transfer
    until @store1.empty?
      @store2.push(@store1.pop)
    end
  end

  def dequeue
    transfer if @store2.empty?
    @store2.pop
  end

  def max
    @store1.max > @store2.max ? @store1.max : @store2.max
  end

  def min
    @store1.min > @store2.min ? @store1.min : @store2.min
  end
end
