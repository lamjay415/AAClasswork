class MaxIntSet
  attr_reader :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] 
      return true
    else
      return false
    end
  end

  private

  def is_valid?(num)
  
    if num <= max && num > 0 
      return true
    else
      raise "Out of bounds" 
    end
  end

  def validate!(num)

  end
end


class IntSet
  attr_reader :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    !include?(num) ? self[num] << num : false
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num) ? true : false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    if count == num_buckets
      resize!
    end
    if !include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num) ? true : false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets *= 2
    temp = @store.flatten
    @store = Array.new(@num_buckets) { Array.new }
    @count = 0
    temp.each { |ele| insert(ele) }
  end
end
