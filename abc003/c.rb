# 入力
n, k = gets.split.map(&:to_i)
r = gets.split.map(&:to_i)

# 初期化
rate = 0.0

# 処理
r.sort!
k.times do |i|
  rate = (rate + r[i-k])/2
end

# 出力
puts rate

