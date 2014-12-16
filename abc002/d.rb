# 入力
n, m = gets.split.map(&:to_i)
friend = Array.new(n){Array.new(n){false}}
m.times do
  x, y = gets.split.map(&:to_i)
  friend[x-1][y-1] = true
  friend[y-1][x-1] = true
end

# 初期化
max = 0
arr = (0..n-1).to_a

# 処理
1.upto(n) do |i|
  arr.combination(i) do |c|
    flag = true
    c.each do |j|
      c.each do |k|
        next if j == k
        flag = false unless friend[j][k]
      end
    end
    max = i if flag
  end
end

# 出力
puts max

