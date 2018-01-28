puzzle_input = Hash.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    arrline = line.split
    puzzle_input[arrline.first.to_i] = (1..arrline.last.to_i).to_a
  end
end

caught_positions = Array.new
for i in (0..puzzle_input.keys.last) do
  if !puzzle_input[i].nil?
    caught_positions << i if i % (2 * (puzzle_input[i].length - 1)) == 0 
  end
end

puts caught_positions.map{ |x| x * puzzle_input[x].length }.inject(:+)

# in order for a position to get caught the firewall should go all the way down and return ((2 * (puzzle_input[i].length - 1))).