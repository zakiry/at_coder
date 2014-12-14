# 今は理解できないので、そのうち・・・

# 入力
n, q = gets.split.map(&:to_i)
x = [0] + gets.split.map(&:to_i)

# 処理
q.times do
  num, a, b, c, d = gets.split.map(&:to_i)
  case num
  when 1
    a.upto(b) do |i|
      x[i] = x[i] + c
    end
  when 2
    x[a..b] = x[c..d]
  when 3
    sum = 0
    a.upto(b) do |i|
      sum = sum + x[i]
    end
    puts sum
  end
end

