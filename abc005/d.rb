# 入力
n = gets.chomp.to_i
d = []
n.times do
  d << gets.chomp.split.map(&:to_i)
end
q = gets.chomp.to_i
p = []
q.times do
  p << gets.chomp.to_i
end

# 初期化
# 左上からの合計値
d2 = Array.new(n+1){Array.new(n+1){0}}
1.upto(n) do |i|
  1.upto(n) do |j|
    d2[i][j] = d2[i][j-1] + d2[i-1][j] - d2[i-1][j-1] + d[i-1][j-1]
  end
end

dp = Array.new(n**2+1){0}

# 処理
getd2 = lambda {|x1, y1, x2, y2|
  return d2[y2][x2] - d2[y1][x2] - d2[y2][x1] + d2[y1][x1]
}

1.upto(n) do |i|
  1.upto(n) do |j|
    i.times do |ii|
      j.times do |jj|
        num = (i-ii)*(j-jj)
        dp[num] = [dp[num], getd2.(ii, jj, i, j)].max
      end
    end
  end
end

1.upto(n**2) do |i|
  dp[i] = [dp[i], dp[i-1]].max
end

# 出力
p.each do |num|
  puts dp[num]
end

