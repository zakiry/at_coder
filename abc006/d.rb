n = gets.chomp.to_i
c = []
n.times do
  c << gets.chomp.to_i
end

dp = []
dp << c[0]

(1..n-1).each do |i|
  if dp[-1] < c[i]
    dp << c[i]
    next
  end
  (i+1).times do |j|
    if dp[j].nil? || dp[j] > c[i]
      dp[j] = c[i]
      break
    end
  end
end

puts n-dp.length

