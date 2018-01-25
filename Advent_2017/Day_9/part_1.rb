puzzle_input = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    puzzle_input += line.chars.flatten
  end
end

puzzle_input.each do |char|
  if char == "<"
    l = puzzle_input.find_index(char)
    until puzzle_input[l+1] == ">" do
      if puzzle_input[l+1] == "!"
        puzzle_input.delete_at(l+2)
        puzzle_input.delete_at(l+1)
      else
        puzzle_input.delete_at(l+1)
      end
    end
    puzzle_input.delete_at(l+1)
  puzzle_input.delete_at(l)
  end
end

clear_puzzle_input = puzzle_input.select{ |x| ["{", "}"].include?(x) }

score = 0
group = 0
clear_puzzle_input.each do |char|
  if char == "{"
    group += 1
    score += group
  else
    group -= 1
  end
end
puts score