input = String.new
File.open("day_1_input.txt", "r") do |f|
  f.each_line do |line|
    input += line
  end
end

input += input.chars.first
count = 0
i = 0

while i != input.chars.length do
  count += input.chars[i].to_i if input.chars[i] == input.chars[i+1]
  i += 1
end

puts count