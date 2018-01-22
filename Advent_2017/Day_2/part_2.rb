array = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    array << line.split.map(&:to_i)
  end
end

count = 0
array.each_with_index do |subarray, y|
  subarray.sort.each do |first|
    (subarray.sort - [first]).each do |second|
      if second % first == 0
        count += second / first
        break
      end
    end
  end
end

puts count