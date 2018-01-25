puzzle_input = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    puzzle_input += line.chars.flatten
  end
end

char_count = 0

puzzle_input.each do |char|
  if char == "<"
    l = puzzle_input.find_index(char)
    until puzzle_input[l+1] == ">" do
      if puzzle_input[l+1] == "!"
        puzzle_input.delete_at(l+2)
        puzzle_input.delete_at(l+1)
      else
        char_count += 1
        puzzle_input.delete_at(l+1)
      end
    end
    puzzle_input.delete_at(l+1)
    puzzle_input.delete_at(l)
  end
end

puts char_count