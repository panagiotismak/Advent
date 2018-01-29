def knot_hash(puzzle_input)
  my_list = (0..255).to_a
  skip_size = 0
  current_position = 0
  suffix = [17, 31, 73, 47, 23]
  puzzle_input += suffix

  64.times do
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
  end

  my_list.each_slice(16).map{ |x| x.inject(:^).to_s(16).rjust(2, '0') }.inject(:+)
end