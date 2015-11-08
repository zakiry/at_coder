n = gets.chomp.to_i

coins = []
n.times do
  coins << gets.chomp.to_i
end

divisor_count = Array.new(coins.length){0}

coins.length.times do |i|
  coins.length.times do |j|
    divisor_count[j] = divisor_count[j]+1 if coins[j]%coins[i]==0
  end
end

e = 0.0
divisor_count.each do |count|
  e = e + (count/2+count%2).to_f/count
end

puts e

