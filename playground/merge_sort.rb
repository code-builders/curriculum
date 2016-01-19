def merge_sort(arr)
  if arr.size <= 1
    return arr
  end
  midway = (arr.length / 2).floor
  left   = arr[0...midway]
  right  = arr[midway..-1]
  merge(merge_sort(left), merge_sort(right)) # => [1,2,3,3]
end

def merge(left, right)
  result = []
  until left.empty? && right.empty?
    if left.empty?
      result << right.shift
    elsif right.empty?
      result << left.shift
    elsif left[0] < right[0]
      result << left.shift
    else
      result << right.shift
    end
  end
  result
end

puts merge_sort([3,4,2,1]).inspect
