# 入力
x1, y1, x2, y2, x3, y3 = gets.split.map(&:to_i)

# 初期化
a = x2 - x1
b = y2 - y1
c = x3 - x1
d = y3 - y1

# 処理
ans = (a*d-b*c).abs / 2.0

# 出力
puts ans

