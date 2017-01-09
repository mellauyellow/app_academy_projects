def my_min(array)
  array.each do |el1|
    array.each do |el2|
      break if el2 < el1
      return el1 if el1 < el2 && el2 == array.last
    end
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def my_min_1(array)
  min = nil
  array.each do |el1|
    min = el1 if array.all? {|el2| el1 <= el2}
  end
  min
end


def my_min_2(array)
  min = nil
  array.each do |el|
    min = el if min.nil? || el < min
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_2(list)

def largest_contiguous_subsum(list)
  max = nil
  subarrays = []

  list.each_with_index do |el1, idx1|
    (idx1...list.length).each do |idx2|
      subarrays << list[idx1..idx2]
    end
  end

  sums = []
  subarrays.each do |array|
    sums << array.inject(:+)
  end

  sums.max
end

def largest_contiguous_subsum_2(list)
  largest = list.first
  current = list.first

  return list.max if list.all? {|el| el < 0 }

  list[1..-1].each do |el|
    current = 0 if current < 0
    current += el
    largest = current if current > largest
  end
  largest
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_2(list)

list = [-5, -1, -3]
p largest_contiguous_subsum_2(list)
