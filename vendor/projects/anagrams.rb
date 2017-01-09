def first_anagram?(string1, string2)
  anagrams = string1.split("").permutation.to_a
  anagrams.include?(string2.split(""))
end

p first_anagram?("elvis", "lives")    #=> true


def second_anagram?(string1, string2)
  # string1_dup = string1.split("")
  string2_dup = string2.split("")

  string1.each_char do |el1|
    string2.each_char.with_index do |el2, idx2|
      if el1 == el2
        string2_dup[idx2] = nil
      end
    end
  end

  string2_dup.all? { |el| el.nil? }
end

# p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvisasdfgasdfg", "livesasdfgasdfg")    #=> true

def third_anagram?(string1, string2)
  sorted1 = string1.split("").sort
  sorted2 = string2.split("").sort

  sorted1 == sorted2
end

p third_anagram?("elvisasdfgasdfg", "livesasdfgasdfg")    #=> true


def fourth_anagram?(string1, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  string1.each_char do |char|
    hash1[char] += 1
  end

  string2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2

end


p fourth_anagram?("elvisasdfgasdfg", "livesasdfgasdfg")    #=> true
