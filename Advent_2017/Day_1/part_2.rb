input = String.new
File.open("input.txt", "r") do |f|
  f.each_line do |line|
    input += line
  end
end

count = 0
i = 0
step = input.chars.length / 2
next_el = 0
while i != 2 * step do
  i + step < 2 * step ? next_el = i + step : next_el = i - step
  count += input.chars[i].to_i if input.chars[i] == input.chars[next_el]
  i += 1 
end

puts count