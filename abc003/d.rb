# 入力
r, c = gets.split.map(&:to_i)
x, y = gets.split.map(&:to_i)
d, l = gets.split.map(&:to_i)

# 初期化
mod = 10**9+7
pascal = Array.new(x*y+1){[]}
(0..(x*y)).each do |i|
  pascal[i][0] = 1
  pascal[i][i] = 1
end
(2..(x*y)).each do |i|
  (pascal[i-1].length-1).times do |j|
    pascal[i][j+1] = pascal[i-1][j] + pascal[i-1][j+1] % mod
  end
end

# 処理
xy = ((r-x+1)*(c-y+1))

diff = 0
arr = [0, 1]
arr.each do |top|
  arr.each do |left|
    arr.each do |bottom|
      arr.each do |right|
        xx = [x-left-right, 0].max
        yy = [y-top-bottom, 0].max
        next if yy*xx < d+l
        if (top+left+bottom+right).odd?
          diff = (diff - pascal[xx*yy][d+l] * pascal[d+l][d]) % mod
        else
          diff = (diff + pascal[xx*yy][d+l] * pascal[d+l][d]) % mod
        end
      end
    end
  end
end

ans = xy * diff % mod

# 出力
puts ans

