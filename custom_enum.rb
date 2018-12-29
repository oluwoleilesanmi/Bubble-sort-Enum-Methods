module Enumerable

  def my_each
    i=0
    while i < self.length
      yield(self[i])
       i += 1
    end     
    self
  end

    def my_each_with_index
    i=0
    while i < self.length
      yield(self[i], i)
       i += 1
    end     
    self
  end

  def my_select
    selected = []
    
    self.my_each do |item|
      selected << item if yield(item)
    end
    selected
  end

  def my_any?
    self.my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_all?
    self.my_each do |item|
      return false if !yield(item)
    end
    true
  end

  def my_none?
    self.my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |item|
        count += 1 if yield(item)
      end
    else
      self.size
    end
  end

  def my_map
    new_arr = []

    if block_given?
      self.my_each do |item|
        block_result = yield(item)
        new_arr << block_result
      end
    else
      self
    end
    new_arr
  end

    def my_map2 (p=nil)
    new_arr = []

    if block_given?
      self.my_each do |item|
        block_result = yield(item)
        new_arr << block_result
      end
    else
      result = p.call
      new_arr << result
    end
    new_arr
  end

  

  def my_inject(initial)
    accumulator = initial ? initial : self[0]

    if initial
      self.my_each do |item|
        accumulator = yield(accumulator, item)
      end
    else
      self.slice(1).my_each do |item|
        accumulator = yield(accumulator, item)
      end
    end
    accumulator
  end

  def multiply_els
    self.my_inject(1) { |total, n| total * n }
  end

end

['ant','bear','cat'].my_each do |word|
  word > 5
end