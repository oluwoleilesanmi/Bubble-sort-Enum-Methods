require 'pry'
=begin
  Algorithm:
    - if there is only one element in the array, it is already sorted
    - define a sorted state and set it to true
    -
    - compare the current element with the next element, if current > next, swap them
    - store the result in an acc array
=end

def bubble_sort(arr)
  # array already sorted
  return arr if arr.size == 1
  swapped = true

  while swapped
    swapped = false
    (0).upto(arr.size - 2) do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swapped = true
      end
    end
  end
  arr
end

p bubble_sort([4,3,78,2,0,2]) #[0,2,2,3,4,78]


