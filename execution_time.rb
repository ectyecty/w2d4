def my_min(list)
  list.each do |number|
    return number if list.all? { |num| number <= num }
  end
end

def my_min_better(list)
  min = nil
  list.each do |number|
    min = number if min.nil? || number < min
  end
  min
end

def largest_sum(list)
  arr = []
  list.each_index do |i|
    length = 1
    while i + length < list.count
      arr << list[i..i + length]
      length += 1
    end
  end

  largest_sum = nil

  arr.each do |sum_arr|
    sum = sum_arr.inject(:+)
    largest_sum = sum if largest_sum.nil? || sum > largest_sum
  end

  largest_sum
end

def largest_sum_better(list)
  largest_sum = nil
  current_sum = nil
  list.each do |number|
    if current_sum.nil?
      current_sum = number
    else
      current_sum += number
    end

    if largest_sum.nil? || largest_sum < current_sum
      largest_sum = current_sum
    end

    current_sum = nil if current_sum < 0
  end
  largest_sum
end

# O(n!)
def first_anagram?(string, target)
  str_arr = string.split("")
  anagrams_arr = str_arr.permutation.to_a
  anagrams = anagrams_arr.map(&:join)

  anagrams.include?(target)
end

# O(n^2)
def second_anagram?(string, target)
  first_array = string.split('')
  target_array = target.split('')

  until first_array.empty?
    letter = first_array.first

    if target_array.include?(letter)
      idx = target_array.find_index(letter)
      target_array.delete_at(idx)

      jdx = first_array.find_index(letter)
      first_array.delete_at(jdx)
    else
      return false
    end
  end

  target_array.count == first_array.count
end

# O(n)
def third_anagram?(start, target)
  start_hash = Hash.new(0)
  target_hash = Hash.new(0)

  start.each_char do |letter|
    start_hash[letter] += 1
  end

  target.each_char do |letter|
    target_hash[letter] += 1
  end

  start_hash.keys.each do |key|
    return false unless start_hash[key] == target_hash[key]
  end
  true
end

# O(n)
def fourth_anagram?(start, target)
  letter_hash = Hash.new(0)

  start.each_char do |letter|
    letter_hash[letter] += 1
  end

  target.each_char do |letter|
    letter_hash[letter] -= 1
  end

  letter_hash.values.all? { |val| val == 0 }
end

# O(nlogn)
def fifth_anagram?(start, target)
  start.split("").sort == target.split("").sort
end

# O(n^2)
def bad_two_sum?(array, target)
  idx = 0
  while idx < array.count - 1
    jdx = idx + 1
    while jdx < array.count
      return true if array[idx] + array[jdx] == target
      jdx += 1
    end
    idx += 1
  end
  false
end

# O(nlogn)
def ok_two_sum?(array, target)
  fake_array = array.dup
  until fake_array.empty?
    num = fake_array.shift
    return true unless bsearch(fake_array, target - num).nil?
  end
  false
end

def bsearch(array, target)
  return nil if array.count == 0

  mid = array.count / 2

  if array[mid] == target
    return mid
  elsif target > array[mid]
    top_half = bsearch(array.drop(mid + 1), target)
    top_half.nil? ? nil : mid + 1 + top_half
  elsif target < array[mid]
    bsearch(array.take(mid), target)
  end
end

# O(n)
def pair_sum?(array, target)
  sum_hash = Hash.new(0)

  array.each do |num|
    sum_hash[num] += 1
  end

  sum_hash.each do |num, count|
    remainder = target - num
    sum_hash[num] -= 1
    return true if sum_hash[remainder] > 0
  end
  false
end
