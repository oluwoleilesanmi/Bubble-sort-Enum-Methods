module Enumerable

  def my_each
    i=0
    while i <= self.length
      yield(self[i])
       i += 1
    end     
    self
  end

    def my_each_with_index
    i=0
    while i <= self.length - 1
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


end