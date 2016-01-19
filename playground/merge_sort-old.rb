def merge_sort(arr)
  return arr if arr.length <= 1
  half  = (arr.length / 2).floor
  left  = arr[0...half]
  right = arr[half..-1]
  merge(merge_sort(left), merge_sort(right))
end

def merge(arr1,arr2,sorted=[])
  until arr1.empty? || arr2.empty?
    sorted << (arr1[0] < arr2[0] ? arr1.shift : arr2.shift)
  end
  sorted + arr1 + arr2
end

puts merge_sort([4,2,3,1,5,1,1,3,4,5,2,11,1,2,2,22,2,2222,2,2,1,3,4,8,9,60,1,3,4]).inspect
