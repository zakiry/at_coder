# 入力
n = gets.chomp.to_i

c = '123456'

# 処理
n %= 30
n.times do |i|
  c[i%5], c[i%5+1] = c[i%5+1], c[i%5]
end

# 出力
puts c

