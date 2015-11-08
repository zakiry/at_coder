n = gets.chomp.to_i

c = []
n.times do
  c << gets.chomp.to_i
end

p_list = c.permutation(c.length)

sum = 0
count = 0
p_list.each do |coins|
  value = 0
  coin_sides = Array.new(coins.length){true}
  coins.length.times do |i|
    value = value+1 if coin_sides[i]
    (i+1).upto(coins.length-1) do |j|
      coin_sides[j] = !coin_sides[j] if coins[j]%coins[i]==0
    end
  end
  sum = sum+value
  count = count+1
end

puts sum.to_f/count
