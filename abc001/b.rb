# 入力
distance = gets.to_i

# 初期化
vv = 0
distance = distance.to_f/1000

# 処理
if distance >= 0.1 && distance <= 5
  vv = distance * 10
elsif distance >= 6   && distance <= 30
  vv = distance + 50
elsif distance >= 35  && distance <= 70
  vv = (distance - 30)/5 + 80
elsif distance >  70
  vv = 89
end

# 出力
puts sprintf("%02d", vv.to_i)

