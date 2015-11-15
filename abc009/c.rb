_, k = gets.chomp.split(' ').map{|num| num.to_i}
s = gets.chomp
ans = s.clone

def diff_count(s1, s2)
  count = 0
  s1.length.times do |i|
    count = count + 1 if s1[i]!=s2[i]
  end
  return count
end

s.length.times do |i|
  letter = ans[i..-1].chars.min
  index = ans.index(letter, i)
  temp = ans.clone
  temp[i], temp[index] = temp[index], temp[i]
  ans = temp if diff_count(s, temp) <= k
end

puts ans

