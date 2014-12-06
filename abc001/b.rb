# 入力
distance = gets.to_i

# 初期化
vv = 0
distance = distance.to_f/1000

# 処理
vv = distance * 10          if distance >= 0.1 && distance <= 5
vv = distance + 50          if distance >= 6   && distance <= 30
vv = (distance - 30)/5 + 80 if distance >= 35  && distance <= 70
vv = 89                     if distance >  70

# 出力
puts sprintf("%02d", vv.to_i)

