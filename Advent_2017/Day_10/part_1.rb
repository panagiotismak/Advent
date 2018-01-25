puzzle_input = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    puzzle_input += line.split(",").map(&:to_i)
  end
end

my_list = (0..255).to_a
skip_size = 0
current_position = 0

puzzle_input.each do |length|
  if current_position + length < my_list.length
    sublist = my_list[current_position, length]
  else
    sublist = my_list[current_position..-1] + my_list[0, length - my_list[current_position..-1].length]
  end

  sublist.reverse!

  i = 0
  sublist.each do |num|
    if current_position + i < my_list.length
      my_list[current_position + i] = num
    else
      my_list[current_position + i - my_list.length] = num
    end
    i += 1
  end
  
  current_position += length + skip_size

  if  current_position > my_list.length
    until current_position < my_list.length do
      current_position = current_position - my_list.length
    end
  end
  
  skip_size += 1
end

puts my_list[0] * my_list[1]