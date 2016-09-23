def windowed_max_range(array, window_size)
  current_max_range = nil

  array.each_with_index do |el, idx|
    range = array[idx...window_size + idx]
    min = range.min
    max = range.max
    if current_max_range.nil? || max - min > current_max_range
      current_max_range = max - min
    end
  end

  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(value)
    @store << value
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end


class MyStack
  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
    @hash = Hash.new { |hash, key| hash[key] = [] }
  end

  def push(value)
    @store << value
    if @min.nil? || value < @min
      @hash[value] << @min
      @min = value
    else
      @hash[value] << nil
    end

    if @max.nil? || value > @max
      @hash[value] << @max
      @max = value
    else
      @hash[value] << nil
    end
  end

  def pop
    if @store.last == @max
      @max = @hash[@max][1]
    elsif @store.last == @min
      @min = @hash[@min][0]
    end
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @store = MyStack.new
    @another_store = MyStack.new
  end

  def enqueue(value)
    @store.push(value)
  end

  def dequeue
    until @store.size == 1
      @another_store.push(@store.pop)
    end
    result = @store.pop
    until @another_store.empty?
      @store.push(@another_store.pop)
    end
    result
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def min
    @store.min
  end

  def max
    @store.max
  end
end

def windowed_max_range_2(array, window)
  stackqueue = StackQueue.new
  current_max_range = nil

  until stackqueue.size == window
    stackqueue.enqueue(array.shift)
  end

  if current_max_range.nil? || stackqueue.max - stackqueue.min > current_max_range
    current_max_range = stackqueue.max - stackqueue.min
  end

  array.each do |el|
    stackqueue.dequeue
    stackqueue.enqueue(el)

    range = stackqueue.max - stackqueue.min
    current_max_range = range if range > current_max_range
  end
  p current_max_range
end

p windowed_max_range_2([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range_2([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_2([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_2([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
