def max_window_range(array, window_size)
  current_max_range = nil

  array.each_index do |index|
    window = array[index...index + window_size]
    range = window.max - window.min
    if current_max_range.nil? || current_max_range < range
      current_max_range = range
    end
  end
  current_max_range
end
