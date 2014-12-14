# 処理
def search(x, h, e)
  route = []
  e[x].each do |y|
    # 一度通ったパスは消す
    e[y] = e[y] - [x]
    result = search(y, h, e)
    # 石を見つけたら移動したルートを記録する
    route = route + result + [x] if result.length != 0
  end

  return [x] + route if route.length != 0
  return [x] if h[x] == 1
  return []
end

# 入力
n, x = gets.split.map(&:to_i)

h = gets.split.map(&:to_i)

e = []
n.times do
  e << []
end

(n-1).times do
  a, b = gets.split.map(&:to_i)
  e[a-1] << b-1
  e[b-1] << a-1
end

# 初期化
route = []

# 処理
route = search(x-1, h, e)

# 出力
puts [route.length - 1, 0].max # 石がないとき用にmaxをとる

