puzzle_input = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    puzzle_input += line.split(",")
  end
end

x = 0
y = 0
z = 0

puzzle_input.each do |step|
  case step
  when 'n'
    y += 1
    x -= 1
  when 's'
    y -= 1
    x += 1
  when 'se'
    x += 1
    z -= 1
  when 'nw'
    x -= 1
    z += 1
  when 'ne'
    y += 1
    z -= 1
  when 'sw'
    z += 1
    y -= 1
  end
end

puts [x.abs, y.abs, z.abs].max