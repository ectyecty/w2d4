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
