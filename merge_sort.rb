def merge_sort array
  #base
  if array.length < 2
    return array
  else
    #split
    left, right = array.each_slice( (array.size/2.0).round ).to_a
    left = merge_sort left
    right = merge_sort right

    #sort
    sorted = []

    until left.empty? || right.empty?
      if left[0] < right[0]
        sorted << left.shift
      else
        sorted << right.shift
      end
    end
    sorted += (left.empty?) ? right : left
  end
end