array = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    array << line.split.map(&:to_i)
  end
end

count = 0
array.each_with_index do |subarray, y|
  count += subarray.max - subarray.min
end

puts count