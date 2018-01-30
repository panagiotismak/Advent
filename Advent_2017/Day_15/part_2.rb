generator_a = 722
generator_b = 354
factor_a = 16807
factor_b = 48271
dividor = 2147483647
count = 0

generator_a_valids = Array.new
generator_b_valids = Array.new

until generator_a_valids.length == 5000000 do
  generator_a = generator_a * factor_a % dividor
  generator_a_valids << generator_a if generator_a % 4 == 0
end

until generator_b_valids.length == 5000000 do
  generator_b = generator_b * factor_b % dividor
  generator_b_valids << generator_b if generator_b % 8 == 0
end

for i in (0..4999999) do
  count +=1 if generator_a_valids[i].to_s(2).rjust(32, '0').chars.each_slice(16).to_a.last.join == generator_b_valids[i].to_s(2).rjust(32, '0').chars.each_slice(16).to_a.last.join
end

puts count