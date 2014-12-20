# 入力
t = gets.chomp.to_i
n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)
m = gets.chomp.to_i
b = gets.chomp.split.map(&:to_i)

# 処理
a.each do |ai|
  break if b.empty?
  b.shift if b.first.between?(ai, ai+t)
end

# 出力
if b.empty?
  puts 'yes'
else
  puts 'no'
end

