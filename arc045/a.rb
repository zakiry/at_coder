# 入力
words = gets.split(' ')

# 処理
ans = []
words.each do |word|
  if word == 'Left'
    ans << '<'
  elsif word =='Right'
    ans << '>'
  else
    ans << 'A'
  end
end

# 出力
puts ans.join(' ')

