
def bubble_sort_by(arr)
  return arr if arr.size == 1
  swapped = true
 
  while swapped
    swapped = false
    (0...arr.size - 1).each do |index|
      block_result = yield(arr[index], arr[index + 1])
      
      if block_result >= 1
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swapped = true
        
      end
    end
  end
  arr
 end
 
p bubble_sort_by (["hi","hello","heys"]) { |left,right|
    left.length - right.length
}