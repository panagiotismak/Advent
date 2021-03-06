puzzle_input = Array.new

File.open("input.txt", "r") do |f|
  i = 0
  f.each_line do |line|
    while i < 128 do
      puzzle_input << (line + "-" + i.to_s).split(//).map{ |x| x.codepoints }.flatten
      i += 1
    end
  end
end

knot_hashes = Array.new
binary = Array.new
count = 0

puzzle_input.each do |puzzle|
  my_list = (0..255).to_a
  skip_size = 0
  current_position = 0
  suffix = [17, 31, 73, 47, 23]
  puzzle += suffix

  64.times do
    puzzle.each do |length|
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
  end

  knot_hashes << my_list.each_slice(16).map{ |x| x.inject(:^).to_s(16).rjust(2, '0') }.inject(:+)
end

knot_hashes.each do |row|
  s = ""
  row.chars.each do |char| 
    s += char.hex.to_s(2).rjust(4, '0')
  end
  binary << s
end

binary.each do |row| 
  count += row.count("1")
end

puts count