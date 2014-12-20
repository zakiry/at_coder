# 入力
n = 4
c = []
n.times do
  c += [gets.chomp.reverse]
end

# 処理
c.reverse!

# 出力
c.each do |str|
  puts str
end

