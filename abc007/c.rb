# 入力
r, c = gets.split(' ').map{|num| num.to_i}
sy, sx = gets.split(' ').map{|num| num.to_i-1}
gy, gx = gets.split(' ').map{|num| num.to_i-1}

map = []
r.times do
  map << gets.chomp
end

# 初期化
dist = Array.new(r+1){Array.new(c+1){3000}}
dist[sy][sx] = 0
q = Queue.new
q.push([sy, sx])

# 処理
until q.empty? do
  y, x = q.pop
  [[y, x+1], [y, x-1], [y+1, x], [y-1, x]].each do |ny, nx|
    if map[ny][nx]=='.' && dist[ny][nx]>dist[y][x]+1
      q.push([ny, nx])
      dist[ny][nx] = dist[y][x]+1
    end
  end
end

# 出力
puts dist[gy][gx]

