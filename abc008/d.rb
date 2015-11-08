@dp = {}

w, h = gets.chomp.split(' ').map{|num| num.to_i}
n = gets.chomp.to_i
@points = []
n.times do
  x, y = gets.chomp.split(' ').map{|num| num.to_i}
  @points << [x, y]
end

def solve(xo, yo, w, h)
  return 0 if xo>w || yo>h
  return @dp[[xo,yo,w,h].join('_')] unless @dp[[xo,yo,w,h].join('_')].nil?
  ans = 0
  @points.each do |point|
    x, y = point.first, point.last
    next if x<xo || x>w || y<yo || y>h

    ans = [ans, w-xo + h-yo + 1 +
      solve(xo, yo, x-1, y-1) + solve(xo, y+1, x-1, h) +
      solve(x+1, yo, w, y-1) + solve(x+1, y+1, w, h)].max
  end
  @dp[[xo,yo,w,h].join('_')] = ans
  ans
end

ans = solve(1, 1, w, h)

puts ans

