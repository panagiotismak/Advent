array = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    array << line.split
  end
end

count = 0
array.each_with_index do |subarray, y|
  count += 1 if subarray.map{ |x| x.chars.sort }.uniq.length == subarray.map{ |x| x.chars.sort }.length
end

puts count