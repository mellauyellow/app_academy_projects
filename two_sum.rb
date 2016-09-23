def bad_two_sum?(arr, target)
  arr.each_with_index do |el1, index1|
    next if index1 + 1 == arr.length
    (index1 + 1...arr.length).each do |index2|
      return true if el1 + arr[index2] == target
    end
  end
  false
end

arr = [0, 1, 5, 7, 8]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# O(n^2)

def okay_two_sum?(arr, target)
  arr = arr.sort

  until arr.length <= 1
    min = arr.first
    upper_bound = target - min

    arr.reject! { |el| el > upper_bound }
    p arr
    return false if arr.length <= 1
    return true if arr.first + arr.last == target

    max = arr.last
    lower_bound = target - max

    arr.reject! { |el| el < lower_bound }
    p arr
    return false if arr.length <= 1
    return true if arr.first + arr.last == target
  end
  false
end

arr = [0, 1, 5, 7, 8]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def pair_sums?(arr, target)
  hash_map = Hash.new(0)

  arr.each do |el|
    hash_map[el] += 1
  end

  p hash_map
  hash_map.keys.each do |key|
    goal = target - key
    return false if goal == key && hash_map[key] < 2
    return true if hash_map.has_key?(goal)
  end
  false
end

arr = [0, 1, 5, 7, 8]
# p okay_two_sum?(arr, 6) # => should be true
p pair_sums?(arr, 10) # => should be false
