input_hash = Hash.new
instructions = Array.new

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    instructions << line
    line_array = line.split
    input_hash[line_array.first] = 0
  end
end

max = input_hash.values.max

instructions.each do |step|
  if eval(input_hash[step.split[4]].to_s + step.split.drop(5).join)
    case step.split[1]
    when "inc"
      input_hash[step.split[0]] += step.split[2].to_i
    when "dec"
      input_hash[step.split[0]] -= step.split[2].to_i
    end
    max = input_hash[step.split[0]] if input_hash[step.split[0]] > max
  end
end

puts max