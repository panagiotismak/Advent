input = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    input << line.to_i
  end
end

count = 0
i = 0

while i < input.length do
  b = input[i]
  input[i] += 1
  i += b
  count += 1
end

puts count