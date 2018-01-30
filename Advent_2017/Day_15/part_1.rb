generator_a = 722
generator_b = 354
factor_a = 16807
factor_b = 48271
dividor = 2147483647
count = 0

40000000.times do
  generator_a = generator_a * factor_a % dividor
  generator_b = generator_b * factor_b % dividor
  binary_a = generator_a.to_s(2).rjust(32, '0')
  binary_b = generator_b.to_s(2).rjust(32, '0')
  count += 1 if binary_a.chars.each_slice(16).to_a.last.join == binary_b.chars.each_slice(16).to_a.last.join
end

puts count