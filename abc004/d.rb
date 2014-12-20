# 入力
r, g, b = gets.chomp.split.map(&:to_i)

# 初期化
N = 1000
INF = 10**7
R, G, B = 400, 500, 600
n = r + g + b
dp = Array.new(n+1){[]}

getdp = lambda {|marble, current|
  if marble <= 0
    return 0
  elsif dp[marble][current].nil?
    return INF
  end
  return dp[marble][current]
}
cost = lambda { |marble, current|
  if marble <= r
    return (current-R).abs
  elsif marble <= r+g
    return (current-G).abs
  end
  return (current-B).abs
}

# 処理
1.upto(n) do |marble|
  marble.upto(N-1) do |j|
    dp[marble][j] = [getdp.(marble, j-1), getdp.(marble-1, j-1)+cost.(marble, j)].min
  end
end

# 出力
arr = []
dp[n].each do |num|
  arr << num unless num.nil?
end
puts arr.min

