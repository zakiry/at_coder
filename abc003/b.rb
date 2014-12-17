# 入力
s = gets.split('')
t = gets.split('')

# 初期化
wildcard = %w[a t c o d e r]

# 処理
win = true
s.length.times do |i|
  next if s[i] == t[i]
  next if s[i]=='@' && wildcard.include?(t[i])
  next if t[i]=='@' && wildcard.include?(s[i])
  win = false
  break
end

# 出力
puts win ? 'You can win' : 'You will lose'

