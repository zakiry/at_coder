# 入力
n = gets.to_i
datas = []
n.times do
  start_time, end_time = gets.split('-').map(&:to_i)
  datas << [
    start_time/100*60 + start_time%100,
    end_time/100*60   + end_time%100
  ]
end

# 初期化
results = []

# 処理
# 5分単位にする
datas.each do |data|
  data[0] = data[0] - data[0]%5
  data[1] = (data[1]+4) - (data[1]+4) % 5
end

# 整理する
datas.sort!
start_time = datas.first[0]
last_time  = datas.first[1]
datas.each do |data|
  if data[0] > last_time
    results << [start_time, last_time]
    start_time = data[0]
    last_time  = data[1]
  else
    last_time = [last_time, data[1]].max
  end
end
results << [start_time, [last_time, datas.last[1]].max]

# 出力
results.each do |result|
puts sprintf("%02d%02d-%02d%02d", result[0]/60, result[0]%60, result[1]/60, result[1]%60)
end

