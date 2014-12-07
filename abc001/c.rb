# 入力
degree, wind_run = gets.split.map(&:to_i)

# 初期化
direction  = 'N'
wind_power = 0

DIRECTIONS  = %w[N NNE NE ENE E ESE SE SSE S SSW SW WSW W WNW NW NNW]
DIRECT_NUM  = 3600 / 16 # 1方位あたりの角度

# 計算しやすいように整数にする
wind_power_def = {
  0 =>  [0,   2],
  1 =>  [3,   15],
  2 =>  [16,  33],
  3 =>  [34,  54],
  4 =>  [55,  79],
  5 =>  [80,  107],
  6 =>  [108, 138],
  7 =>  [139, 171],
  8 =>  [172, 207],
  9 =>  [208, 244],
  10 => [245, 284],
  11 => [285, 326],
  12 => [327, 2000] # 入力の値より、最大200なため
}

# 処理
# 風力
wind_run = (wind_run.to_f/6).round
wind_power_def.each do |key, range|
  wind_power = key if wind_run >= range.first && wind_run <= range.last
end

# 風向
# 0 をNとNNWの境界に合わせる
degree = (degree + DIRECT_NUM/2) % 3600
direction = DIRECTIONS[(degree/DIRECT_NUM).floor]
# 風力0だったらCにする
direction = 'C' if wind_power == 0

# 出力
puts "#{direction} #{wind_power}"

